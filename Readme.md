# Table of Contents

-   [About](#about)
-   [Prerequisite](#prerequisite)
    -   [Tools](#tools)
    -   [Third party tools](#third-party-tools)
-   [Installation](#installation)
    -   [Build from chiselapp (fossil)](#build-from-chiselapp--fossil-)
    -   [Download from DockerHub](#download-from-dockerhub)
    -   [Build from GitHub](#build-from-github)
    -   [Contfiguration](#contfiguration)
        -   [Build arguments](#build-arguments)
        -   [Example of build](#example-of-build)
-   [Quickstart](#quickstart)
    -   [Manage OpenACS using docker-compose](#manage-openacs-using-docker-compose)
        -   [Prerequisite](#prerequisite)
        -   [Start/stop interactive](#start-stop-interactive)
        -   [Start/stop/remove as daemon](#start-stop-remove-as-daemon)
        -   [View logs](#view-logs)
        -   [View list containers](#view-list-containers)
        -   [Prune all](#prune-all)
-   [Configuration options](#configuration-options)
    -   [General options](#general-options)
    -   [Timezone](#timezone)
    -   [OpenACS listen port](#openacs-listen-port)
    -   [NaviServer configuration file](#naviserver-configuration-file)
    -   [NaviServer variable file](#naviserver-variable-file)
    -   [Database hostname](#database-hostname)
    -   [Database username](#database-username)
    -   [Database password](#database-password)
    -   [Postgres tag](#postgres-tag)
-   [CI/CD](#ci-cd)
-   [Maintenance](#maintenance)
    -   [Shell access](#shell-access)



<a id="about"></a>

# About

This is [OpenACS](https://openacs.org/) on [Ubuntu base docker image](https://hub.docker.com/_/ubuntu) (version 20.04) .  To install OpenACS I used  code from  [Gustaf Neumann](https://github.com/gustafn/install-ns) script [install-oacs.sh](https://github.com/gustafn/install-ns/blob/master/install-oacs.sh). The base image is [oupfiz5/openacs](https://hub.docker.com/r/oupfiz5/openacs)

OpenACS is self-hosting at <https://chiselapp.com/user/oupfiz5/repository/openacs>.

If you are reading this on GitHub, then you are looking at a Git mirror of the self-hosting OpenACS repository.  The purpose of that mirror is to test and exercise Fossil's ability to export a Git mirror and using GitHub CI/CD  (GitHub Actions). Nobody much uses the GitHub mirror, except to verify that the mirror logic works. If you want to know more about OpenACS, visit the official self-hosting site linked above.


<a id="prerequisite"></a>

# Prerequisite


<a id="tools"></a>

## Tools

1.  \*nix operation system
2.  Install Docker
3.  Install git (optional)
4.  Install fossil (optional)


<a id="third-party-tools"></a>

## Third party tools

They are using for testing and scanning:

1.  [Bats](https://github.com/bats-core)
2.  [Shellcheck](https://www.shellcheck.net/)
3.  [Hadolynt](https://github.com/hadolint/hadolint)
4.  [Dockle](https://github.com/goodwithtech/dockle)
5.  Snyk - not necessarily
6.  Trivy - not necessarily


<a id="installation"></a>

# Installation


<a id="build-from-chiselapp--fossil-"></a>

## Build from chiselapp (fossil)

    fossil clone https://chiselapp.com/user/oupfiz5/repository/openacs openacs.fossil
    mkdir openacs
    cd openacs
    fossil open ../openacs.fossil
    docker build -t oupfiz5/openacs -f ./Dockerfile .


<a id="download-from-dockerhub"></a>

## Download from DockerHub

You can download docker images from dockerhub:

    docker pull oupfiz5/openacs:oacs-5-10


<a id="build-from-github"></a>

## Build from GitHub

    git clone https://github.com/oupfiz5/openacs.git
    cd openacs
    docker build -t oupfiz5/openacs -f ./Dockerfile .


<a id="contfiguration"></a>

## Contfiguration


<a id="build-arguments"></a>

### Build arguments

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Arguments</th>
<th scope="col" class="org-left">Default</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">BUILD_DATE</td>
<td class="org-left">none</td>
<td class="org-left">Set build date for label</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">OACS_TAG</td>
<td class="org-left">oacs-5-10</td>
<td class="org-left">Set default OpenACS version</td>
</tr>
</tbody>
</table>


<a id="example-of-build"></a>

### Example of build

    docker build --no-cache \
      --build-arg BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
      --build-arg OACS_TAG="oacs-5-10" \
      -t oupfiz5/openacs:oacs-5-10 \
      -f ./Dockerfile \
      .


<a id="quickstart"></a>

# Quickstart


<a id="manage-openacs-using-docker-compose"></a>

## Manage OpenACS using docker-compose


<a id="prerequisite"></a>

### Prerequisite

Clone repository from:

-   fossil:

        fossil clone https://chiselapp.com/user/oupfiz5/repository/openacs openacs.fossil
        mkdir openacs
        cd openacs
        fossil open ../openacs.fossil

-   GitHub:

        git clone https://github.com/oupfiz5/openacs.git
        cd openacs


<a id="start-stop-interactive"></a>

### Start/stop interactive

start:

    docker-compose up

The site will be accessible by url  <http://localhost:8080>.

stop:

    <Ctrl>+C


<a id="start-stop-remove-as-daemon"></a>

### Start/stop/remove as daemon

start :

    docker-compose up -d

The site will be accessible by url  <http://localhost:8080>.

stop:

    docker-compose down

remove:

    docker-compose rm


<a id="view-logs"></a>

### View logs

Logs follow:

    docker-compose logs -f

Logs tail:

    docker-compose logs --tail=10


<a id="view-list-containers"></a>

### View list containers

    docker-compose ps


<a id="prune-all"></a>

### Prune all

    docker system prune --volumes --force


<a id="configuration-options"></a>

# Configuration options


<a id="general-options"></a>

## General options

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Option</th>
<th scope="col" class="org-left">Default</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left"><a href="#timezone">TZ</a></td>
<td class="org-left">UTC</td>
<td class="org-left">Set timezone, example Europe/Moscow</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left"><a href="#openacs-listen-port">OACS_LISTEN_PORT</a></td>
<td class="org-left">8080</td>
<td class="org-left">Set http listen port, example 8080</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left"><a href="#naviserver-configuration-file">NS_CONF</a></td>
<td class="org-left">openacs_config.tcl</td>
<td class="org-left">Configuration file for NaviServer</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left"><a href="#naviserver-variable-file">NS_VARS</a></td>
<td class="org-left">config_vars.tcl</td>
<td class="org-left">Variable file for NaviServer</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left"><a href="#database-hostname">DB_HOST</a></td>
<td class="org-left">postgres</td>
<td class="org-left">Database host name</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left"><a href="#database-username">DB_USER</a></td>
<td class="org-left">openacs</td>
<td class="org-left">Database user name</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left"><a href="#database-password">DB_PASS</a></td>
<td class="org-left">testing</td>
<td class="org-left">Database user password</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left"><a href="#postgres-tag">POSTGRES_TAG</a></td>
<td class="org-left">14.1-alpine</td>
<td class="org-left">Postgres image tag</td>
</tr>
</tbody>
</table>

All options have predifined values and store in file `.env` .


<a id="timezone"></a>

## Timezone

Set the timezone for the containers, defaults to UTC. To set the timezone set the desired timezone with the variable TZ.

    TZ="Europe/Moscow" docker-compose up


<a id="openacs-listen-port"></a>

## OpenACS listen port

`OACS_LISTEN_PORT` set the http listen port for the openacs.  In this case the OpenACS is accessible by URL [http://localhost:8070](http://localhost:8070).

    OACS_LISTEN_PORT=8070 docker-compose up


<a id="naviserver-configuration-file"></a>

## NaviServer configuration file

`NS_CONF` - configuration file. Default value is `/usr/local/ns/conf/openacs-config.tcl`

1.  Put the configuration file to `rootfs/usr/local/ns/conf`
2.  Run docker compose

        NS_CONF="/usr/local/ns/conf/my-config.tcl" docker-compose up


<a id="naviserver-variable-file"></a>

## NaviServer variable file

`NS_VARS` - - configuration file. This configuration file contains several parameters which are frequently changed (e.g. for debug or other configurations). The provided NaviServer configuation file reads the variable file and uses its values.  Default value is `/usr/local/ns/conf/config_vars.tcl`

1.  Put the configuration file to `rootfs/usr/local/ns/conf`
2.  Run docker compose

        NS_VARS="/usr/local/ns/conf/my_vars.tcl" docker-compose up


<a id="database-hostname"></a>

## Database hostname

`DB_HOST` set the database hostname for the openacs. By default it has name of docker-compose database  service - postgres.

    DB_HOST=foo docker-compose up


<a id="database-username"></a>

## Database username

`DB_USER` set the database username for the openacs and postgres.

    DB_USER=foouser docker-compose up


<a id="database-password"></a>

## Database password

`DB_PASS` set the database user password for the openacs and postgres.

    DB_PASS=foopass docker-compose up


<a id="postgres-tag"></a>

## Postgres tag

`POSTGRES_TAG` set the docker image tag for [official postgres](https://hub.docker.com/_/postgres).  Pay attention - some openacs version can use only correspond version of postgres.

    POSTGRES_TAG="14.1-alpine" docker-compose up


<a id="ci-cd"></a>

# CI/CD

For  build and push docker images we use  [GitHub Actions workflow](https://github.com/oupfiz5/openacs/blob/master/.github/workflows/on-push.yaml).


<a id="maintenance"></a>

# Maintenance


<a id="shell-access"></a>

## Shell access

For debugging and maintenance purposes you may want access the containers shell. If you are using Docker version 1.3.0 or higher you can access a running containers shell by starting bash using docker exec:

    docker exec -it openacs_openacs_1 /bin/bash

    docker exec -it openacs_postgres_1 /bin/bash
