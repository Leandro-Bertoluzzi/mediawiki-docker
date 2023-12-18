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

## :dart: About
Docker compose setup to play around with [Mediawiki](https://www.mediawiki.org/wiki/MediaWiki), with automated configuration stage.

## :sparkles: Features
:heavy_check_mark: Automatic installation of Mediawiki 

## :rocket: Technologies
The following tools were used in this project:

- [Mediawiki](https://www.mediawiki.org/wiki/MediaWiki)
- [Docker](https://www.docker.com/)
- [MariaDB](https://mariadb.org/ )

## :white_check_mark: Requirements
Before starting :checkered_flag:, you need to have [Docker](https://www.docker.com/) installed.

## :checkered_flag: Starting
```bash
# Clone this project
$ git clone https://github.com/Leandro-Bertoluzzi/mediawiki-docker

# Access the project
$ cd mediawiki-docker

# Copy and configure environment variables
$ cp db.env.dist db.env
$ cp wiki.env.dist wiki.env

# Start the containers
$ docker compose up -d

# The wiki will initialize in the <http://localhost:8000>
```

**NOTE:** In the step of configuring environment variables, you can use the following method to generate `MEDIAWIKI_SECRET_KEY`:

```bash
$ docker exec -it wiki-app php -a
php > echo bin2hex(random_bytes(32));
```

In a similar way, you can generate `MEDIAWIKI_UPGRADE_KEY` by using:

```bash
$ docker exec -it wiki-app php -a
php > echo bin2hex(random_bytes(8));
```

## :bulb: Tips and tricks

- You can check the installed extensions in the [Special:Version](http://localhost:8000/index.php/Special:Version) page.

## :memo: License
This project is under license from MIT. For more details, see the [LICENSE](LICENSE.md) file.


Made with :heart: by <a href="https://github.com/Leandro-Bertoluzzi" target="_blank">Leandro Bertoluzzi</a>

&#xa0;

<a href="#top">Back to top</a>
