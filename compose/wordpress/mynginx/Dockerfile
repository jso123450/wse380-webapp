FROM nginx:1.25.4-alpine

# drop symlinks
RUN unlink /var/log/nginx/access.log
RUN unlink /var/log/nginx/error.log