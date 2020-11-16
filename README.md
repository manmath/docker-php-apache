# Overview

* Platform: Ubuntu 20.04
* PHP: 7.4
* Apache: 2.4

# Maintainer

* Man Math <man@web-essentials.co>

# Build new docker image

```bash
docker build -t [docker-image-name] .
```

Example:

> docker build -t ubuntu18.04-php7.2-apache2 .

# Release docker image to WE cloud

1. Tag version

    ```bash
    docker tag {docker-image-name}:{latest-build-tag} dockerhub.web-essentials.co/{docker-image-name}:{release-version}
    ```

    Example:

    > docker tag ubuntu18.04-php7.2-apache2:latest dockerhub.web-essentials.co/ubuntu18.04-php7.2-apache2:7.2.0

2. Push image to cloud

    ```bash
    docker push dockerhub.web-essentials.co/{docker-image-name}:{release-version}
    ```

    Example:

    > docker push dockerhub.web-essentials.co/ubuntu18.04-php7.2-apache2:7.2.0

# Working with `docker-compose`

1. Create file `docker-compose.yml`

2. Configure yaml file

    ```bash
    version: "3.1"
    services:
      web:
        image: dockerhub.web-essentials.co/ubuntu18.04-php7.2-apache2:{version}
    ```

# [Changelog](CHANGELOG.md)
