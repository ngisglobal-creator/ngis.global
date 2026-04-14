# Use lightweight Nginx server
FROM nginx:alpine

# Copy all project files to Nginx html directory
COPY . /usr/share/nginx/html/

# Rename the main file to index.html so it serves automatically
RUN mv /usr/share/nginx/html/ngis.html /usr/share/nginx/html/index.html

# Update Nginx config to listen to Railway's dynamic $PORT environments variable before starting
CMD ["/bin/sh", "-c", "sed -i 's/80;/${PORT:-80};/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
