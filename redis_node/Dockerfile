ARG VERSION=6.0.7
FROM redis:$VERSION
COPY redis.conf /usr/local/etc/redis/redis.conf
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]
