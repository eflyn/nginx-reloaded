FROM nginx:latest

# Install inotify-tools to watch file changes
RUN apt-get update && apt-get install -y inotify-tools

# Add our custom entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
