# Build new docker image

```bash
docker build -t [docker-image-name] .
```

Example:

> docker build -t php-apache .

# Release docker image to cloud

1. Tag version

    ```bash
    docker tag {docker-image-name}:{latest-build-tag} manmath/{docker-image-name}:{release-version}
    ```

    Example:

    > docker tag php-apache:latest manmath/php-apache:1.0

2. Push image to cloud

    ```bash
    docker push manmath/{docker-image-name}:{release-version}
    ```

    Example:

    > docker push manmath/php-apache:1.0
