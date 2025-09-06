# Use nginx to serve the static HTML file
FROM nginx:alpine

# Copy the HTML file to the nginx html directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# The nginx image already has the correct CMD to start nginx