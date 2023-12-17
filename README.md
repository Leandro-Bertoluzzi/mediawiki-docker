<h1 align="center">Mediawiki Docker</h1>

<p align="center">
  <img alt="Github top language" src="https://img.shields.io/github/languages/top/Leandro-Bertoluzzi/mediawiki-docker?color=56BEB8">

  <img alt="Github language count" src="https://img.shields.io/github/languages/count/Leandro-Bertoluzzi/mediawiki-docker?color=56BEB8">

  <img alt="Repository size" src="https://img.shields.io/github/repo-size/Leandro-Bertoluzzi/mediawiki-docker?color=56BEB8">

  <img alt="License" src="https://img.shields.io/github/license/Leandro-Bertoluzzi/mediawiki-docker?color=56BEB8">
</p>

<hr>

<p align="center">
  <a href="#dart-about">About</a> &#xa0; | &#xa0; 
  <a href="#sparkles-features">Features</a> &#xa0; | &#xa0;
  <a href="#rocket-technologies">Technologies</a> &#xa0; | &#xa0;
  <a href="#white_check_mark-requirements">Requirements</a> &#xa0; | &#xa0;
  <a href="#checkered_flag-starting">Starting</a> &#xa0; | &#xa0;
  <a href="#memo-license">License</a> &#xa0; | &#xa0;
  <a href="https://github.com/Leandro-Bertoluzzi" target="_blank">Author</a>
</p>

<br>

## :dart: About ##

Docker compose setup to play around with [Mediawiki](https://www.mediawiki.org/wiki/MediaWiki).

## :sparkles: Features ##

:heavy_check_mark: Automatic installation of Mediawiki 

## :rocket: Technologies ##

The following tools were used in this project:

- [Mediawiki](https://www.mediawiki.org/wiki/MediaWiki)
- [Docker](https://www.docker.com/)
- [MariaDB](https://mariadb.org/ )

## :white_check_mark: Requirements ##

Before starting :checkered_flag:, you need to have [Docker](https://www.docker.com/) installed.

## :checkered_flag: Starting ##

```bash
# Clone this project
$ git clone https://github.com/Leandro-Bertoluzzi/mediawiki-docker

# Access
$ cd mediawiki-docker

# Start the containers
$ docker compose up

# The wiki will initialize in the <http://localhost:8000>
```

Once there, you'll have to run through the installation wizard and, in the end, you'll be given a `LocalSettings.php` file. You have to download it and copy it into the container with the next command:

```bash
$ docker cp c:\path\to\downloaded\file wiki-app:/var/www/html/
```

Now with the configurations file already in the container, you can uncomment the line for this file in `mediawiki` > `volumes`, in the `docker-compose.yml` file.

## :memo: License ##

This project is under license from MIT. For more details, see the [LICENSE](LICENSE.md) file.


Made with :heart: by <a href="https://github.com/Leandro-Bertoluzzi" target="_blank">Leandro Bertoluzzi</a>

&#xa0;

<a href="#top">Back to top</a>
