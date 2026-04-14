# Use Caddy, a modern ultra-lightweight web server perfect for PaaS platforms like Railway
FROM caddy:alpine

# Copy all project files to Caddy's default directory
COPY . /srv/

# Rename the main file to index.html so it serves automatically
RUN mv /srv/ngis.html /srv/index.html

# Start Caddy as a file server and listen dynamically on Railway's $PORT (or 8080 as fallback)
CMD caddy file-server --root /srv --listen :${PORT:-8080}
