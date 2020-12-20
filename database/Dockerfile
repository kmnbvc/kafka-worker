FROM debezium/postgres:9.6
COPY init.sql /docker-entrypoint-initdb.d/
RUN chown postgres:postgres /docker-entrypoint-initdb.d/init.sql

CMD ["/docker-entrypoint.sh", "postgres"]