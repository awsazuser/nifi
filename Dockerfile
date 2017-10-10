FROM openjdk:8-jre
LABEL maintainer "awsazuser"

ARG NIFI_VERSION=1.3.0
ARG MIRROR=https://archive.apache.org/dist

ENV NIFI_BASE_DIR /opt/nifi 
ENV NIFI_HOME=$NIFI_BASE_DIR/nifi-$NIFI_VERSION 
ENV NIFI_BINARY_URL=/nifi/$NIFI_VERSION/nifi-$NIFI_VERSION-bin.tar.gz

RUN mkdir -p $NIFI_HOME/conf/templates 


# Download, validate, and expand Apache NiFi binary.
RUN curl -fSL $MIRROR/$NIFI_BINARY_URL -o $NIFI_BASE_DIR/nifi-$NIFI_VERSION-bin.tar.gz \
    && echo "$(curl https://archive.apache.org/dist/$NIFI_BINARY_URL.sha256) *$NIFI_BASE_DIR/nifi-$NIFI_VERSION-bin.tar.gz" | sha256sum -c - \
    && tar -xvzf $NIFI_BASE_DIR/nifi-$NIFI_VERSION-bin.tar.gz -C $NIFI_BASE_DIR \
    && rm $NIFI_BASE_DIR/nifi-$NIFI_VERSION-bin.tar.gz 

# Web HTTP Port & Remote Site-to-Site Ports


ADD startnifi.sh /opt/nifi/startnifi.sh
RUN chmod 777 /opt/nifi/startnifi.sh

WORKDIR $NIFI_HOME

EXPOSE 8080 8081 8082
# Startup NiFi
ENTRYPOINT ["/opt/nifi/startnifi.sh"]
CMD ["run"]
