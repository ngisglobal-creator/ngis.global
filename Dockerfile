# Use lightweight Nginx server
FROM nginx:alpine

# Remove default Nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy all project files to Nginx html directory
COPY . /usr/share/nginx/html/

# Rename the main file to index.html so it serves automatically upon visiting the domain
RUN mv /usr/share/nginx/html/ngis.html /usr/share/nginx/html/index.html

# Expose port 80 (Railway will automatically detect this and route traffic)
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
