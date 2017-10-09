FROM apache/nifi:1.4.0
MAINTAINER testing

ENV NIFI_BASE_DIR /opt/nifi 
ADD nifi.properties /opt/nifi/nifi.properties
EXPOSE 8080 8181
WORKDIR $NIFI_HOME

# Startup NiFi
ENTRYPOINT ["bin/nifi.sh"]
CMD ["run"]
