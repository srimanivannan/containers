FROM postgres:alpine
COPY ./init.sql /docker-entrypoint-initdb.d/
RUN chmod a+x /docker-entrypoint-initdb.d/init.sql
ENV POSTGRES_PASSWORD ram1nus
ENV POSTGRES_DB <<your password here>>
ENV POSTGRES_USER raminus
EXPOSE 5432