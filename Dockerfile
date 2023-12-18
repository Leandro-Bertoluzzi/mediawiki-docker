FROM mediawiki:1.40

WORKDIR /var/www/html

# Install dependencies
RUN apt-get update && apt-get install -y netcat-traditional

# Copy local files
COPY LocalSettings.php /var/www/html/LocalSettings.php
COPY entrypoint.sh /entrypoint.sh

# Updated file permissions and execute initialization script
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# Run the server in the foreground
CMD ["apache2-foreground"]