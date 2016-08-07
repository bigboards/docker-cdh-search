# Pull base image.
#FROM bigboards/cdh-base-__arch__
FROM bigboards/cdh-base-x86_64

MAINTAINER bigboards
USER root

# Install hadoop-client
RUN apt-get update \
    && apt-get install -y solr-server \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archives/*

# declare the volumes
RUN mkdir /etc/hadoop/conf.bb && \
    update-alternatives --install /etc/hadoop/conf hadoop-conf /etc/hadoop/conf.bb 1 && \
    update-alternatives --set hadoop-conf /etc/hadoop/conf.bb
VOLUME /etc/hadoop/conf.bb

# external ports
#EXPOSE 2222

CMD ["/bin/bash"]
