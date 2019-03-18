FROM nginx:alpine

COPY resources/ssl.conf /etc/nginx/conf.d/ssl.conf
COPY resources/ssl-redirect.conf /etc/nginx/default.d/ssl-redirect.conf

RUN mkdir -p /etc/ssl/certs && \
    chmod 700 -R /etc/ssl/certs

COPY resources/certs/onlycertificate.crt /etc/ssl/certs/
COPY resources/certs/privatekey.key /etc/ssl/certs/
