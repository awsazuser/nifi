FROM apache/nifi:1.4.0
MAINTAINER testing

ADD startnifi.sh /opt/nifi/startnifi.sh
RUN chmod 777 /opt/nifi/startnifi.sh
EXPOSE 8080 8181

# Startup NiFi
CMD ["/bin/bash", "/opt/nifi/startnifi.sh"]
