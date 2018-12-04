# Overview

* Platform: Ubuntu 18.04
* PHP: 7.2
* Apache: 2.4

# Maintainer

* Man Math <man@web-essentials.co>

# Build new docker image

```bash
docker build -t [docker-image-name] .
``

Example:

> docker build -t manmath-docker-apache2 .

# Release docker image to WE cloud

1. Tag version

    ```bash
    docker tag {docker-image-name}:{latest-build-tag} docker.web-essentials.asia:5000/{docker-image-name}:{release-version}
    ```

    Example:

    > docker tag manmath-docker-apache2:latest docker.web-essentials.asia:5000/manmath-docker-apache2:0.0.1

2. Push image to cloud

    ```bash
    docker push docker.web-essentials.asia:5000/{docker-image-name}:{release-version}
    ```

    Example:

    > docker push docker.web-essentials.asia:5000/manmath-docker-apache2:0.0.1

# Working with `docker-compose`

1. Create file `docker-compose.yml`

2. Configure yaml file

    ```bash
    version: "3.1"
    services:
      web:
        image: docker.web-essentials.asia:5000/manmath-docker-apache2:{version}
    ```

# [Changelog](CHANGELOG.md)
