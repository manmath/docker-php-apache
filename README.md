# Overview

* Platform: Ubuntu 22.04
* PHP: 8.1
* Apache: 2.4

# Maintainer

* Man Math <manmath4@gmail.com>

# Working with `docker-compose`

1. Create file `docker-compose.yml`

2. Configure yaml file

    ```bash
    version: "3.9"
    services:
      web:
        image: manmath/flex-serve:latest
    ```

# Available images

1. manmath/flex-serve:8.1
