# Use official NGINX image as base
FROM nginx:alpine

# Copy the portfolio website to NGINX html directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 for web traffic
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]
