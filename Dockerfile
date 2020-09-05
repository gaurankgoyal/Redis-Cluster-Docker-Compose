FROM redis:6.0.7
RUN apt-get update -qq && apt-get install iputils-ping -yqq && apt-get clean -yqq
RUN mkdir -p /usr/local/etc/redis/
EXPOSE 6379
RUN mkdir -p /usr/data
COPY cluster_init.sh /usr/data
RUN chmod 755 /usr/data/cluster_init.sh
ENTRYPOINT ["/usr/data/cluster_init.sh"]
CMD ["redis-cluster"]
