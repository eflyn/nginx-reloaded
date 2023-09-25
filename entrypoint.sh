#!/bin/sh

# Get NGINX_RELOADED_PATH from ENV or set to default
CONFIG_PATH=${NGINX_RELOADED_PATH:-'/etc/nginx/nginx-reloaded/nginx.conf'}

# Start the inotifywait loop in the background
while inotifywait -e modify,delete_self,move_self $CONFIG_PATH; do
    echo "Detected changes in nginx.conf. Reloading nginx..."
    nginx -s reload
done &

# Start Nginx in the foreground with the custom config
exec nginx -g "daemon off;" -c $CONFIG_PATH