FROM postgres:alpine
ENV POSTGRES_DB domainspace
ENV POSTGRES_PASSWORD rds_user
ENV POSTGRES_USER rds_user
COPY ./init.sql /docker-entrypoint-initdb.d/
RUN chmod 777 /docker-entrypoint-initdb.d/init.sql
EXPOSE 5432
