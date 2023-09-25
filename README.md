# nginx-reloaded

`nginx-reloaded` is a simple, yet powerful alternative to the default nginx Docker image. This container runs a self-reloading nginx server and works well when mounting `nginx.conf` as a ConfigMap in Kubernetes environments.

## Features

- **Automatic Silent Reload**: With the help of `inotify-tools`, nginx can detect changes in the `nginx.conf` and reload without any disruption.
- **Minimalistic Design**: Built on top of the official nginx Docker image, `nginx-reloaded` is lightweight and straightforward.
- **Custom Path Support**: You can specify a custom path for `nginx.conf` using the `NGINX_RELOADED_PATH` environment variable.

## Quick Start

To get started with `nginx-reloaded`, ensure you have Docker installed and running.

1. **Build the Docker image**:

    ```bash
    docker build -t nginx-reloaded:latest .
    ```

2. **Run the Docker container**:

    ```bash
    docker run -d --name nginx-reloaded-container nginx-reloaded:latest
    ```

## Custom Configuration

To provide your custom `nginx.conf` mount it to `/etc/nginx/nginx-reloaded/nginx.conf` when running your container.

```bash
docker run -d --name nginx-reloaded-container -v /path/to/your/nginx.conf:/etc/nginx/nginx-reloaded/nginx.conf nginx-reloaded:latest
```

### Specifying a Custom Path

To use a custom path for `nginx.conf`, set the `NGINX_RELOADED_PATH` environment variable when running the Docker container.

```bash
docker run -d --name nginx-reloaded-container -e NGINX_RELOADED_PATH=/path/to/your/nginx.conf nginx-reloaded:latest
```

## Behind the Scenes

The magic behind the auto-reloading feature is `inotify-tools`. When the `nginx.conf` undergoes changes like modifications or deletion, the `inotifywait` loop detects these alterations and reloads nginx.

For further details, refer to the provided Dockerfile and entrypoint.sh.

## Contributions & Support

This project is designed and maintained by Eflyn. Contributions, feedback, and issues are welcome.
