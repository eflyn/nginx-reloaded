#!/bin/sh

# Start the inotifywait loop in the background
while inotifywait -e modify,delete_self,move_self /etc/nginx/nginx-reloaded/nginx.conf; do
    echo "Detected changes in nginx.conf. Reloading nginx..."
    nginx -s reload
done &

# Start Nginx in the foreground with the custom config
exec nginx -g "daemon off;" -c /etc/nginx/nginx-reloaded/nginx.conf
