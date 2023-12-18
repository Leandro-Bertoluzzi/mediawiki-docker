#!/bin/bash

# The shell exits when a command fails
set -e

# Set some default values
: ${MEDIAWIKI_UPDATE:=false}
: ${MEDIAWIKI_SHARED:=/data}

# Wait for the DB to come up
while [ `/bin/nc -w 1 $MEDIAWIKI_DB_HOST $MEDIAWIKI_DB_PORT < /dev/null > /dev/null; echo $?` != 0 ]; do
    echo "Waiting for database to come up at $MEDIAWIKI_DB_HOST:$MEDIAWIKI_DB_PORT..."
    sleep 1
done

cd /var/www/html

# If there is no "shared data" folder, create it
if [ ! -d "$MEDIAWIKI_SHARED" ]; then
    mkdir -p $MEDIAWIKI_SHARED
fi
mkdir -p "$MEDIAWIKI_SHARED/images"

# If there is no LocalSettings.php, create one using maintenance/install.php
if [ ! -e "$MEDIAWIKI_SHARED/installed" -a ! -f "$MEDIAWIKI_SHARED/install.lock" ]; then
    touch $MEDIAWIKI_SHARED/install.lock
    mv LocalSettings.php LocalSettings.php.bak
	php maintenance/install.php \
        --confpath /var/www/html \
        --dbname "$MEDIAWIKI_DB_NAME" \
        --dbport "$MEDIAWIKI_DB_PORT" \
        --dbserver "$MEDIAWIKI_DB_HOST" \
        --dbtype "$MEDIAWIKI_DB_TYPE" \
        --dbuser "$MEDIAWIKI_DB_USER" \
        --dbpass "$MEDIAWIKI_DB_PASSWORD" \
        --installdbuser "$MEDIAWIKI_DB_USER" \
        --installdbpass "$MEDIAWIKI_DB_PASSWORD" \
        --server "$MEDIAWIKI_SITE_SERVER" \
        --scriptpath "" \
        --lang "$MEDIAWIKI_SITE_LANG" \
        --pass "$MEDIAWIKI_ADMIN_PASS" \
        --with-extensions \
        "$MEDIAWIKI_SITE_NAME" \
        "$MEDIAWIKI_ADMIN_USER"

    touch $MEDIAWIKI_SHARED/installed
    mv LocalSettings.php.bak LocalSettings.php
    # run update.php as extensions need to create tables
    php maintenance/update.php --quick
    rm $MEDIAWIKI_SHARED/install.lock
fi

# If LocalSettings.php exists, then attempt to run the update.php maintenance
# script. If already up to date, it won't do anything, otherwise it will
# migrate the database if necessary on container startup. It also will
# verify the database connection is working.
if [ -e "LocalSettings.php" -a "$MEDIAWIKI_UPDATE" = 'true' -a ! -f "$MEDIAWIKI_SHARED/update.lock" ]; then
    touch $MEDIAWIKI_SHARED/update.lock
	echo >&2 'info: Running maintenance/update.php';
	php maintenance/update.php --quick --conf ./LocalSettings.php
    rm $MEDIAWIKI_SHARED/update.lock
fi

# Takes any command line arguments passed to entrypoint.sh and execs them as a command.
# The intention is basically "Do everything in this .sh script, then in the same shell
# run the command the user passes in on the command line".
exec "$@"