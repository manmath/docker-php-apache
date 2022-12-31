# Build new docker image

```bash
docker build -t [docker-image-name] .
```

Example:

> docker build -t flex-serve .

# Release docker image to cloud

1. Tag version

    ```bash
    docker tag {docker-image-name}:{latest-build-tag} manmath/{docker-image-name}:{release-version}
    ```

    Example:

    > docker tag flex-serve:latest manmath/flex-serve:1.0

2. Push image to cloud

    ```bash
    docker push manmath/{docker-image-name}:{release-version}
    ```

    Example:

    > docker push manmath/flex-serve:1.0
