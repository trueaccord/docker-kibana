#
# Kibana Dockerfile
#
# https://github.com/eliotk/docker-kibana
#

# Pull base image.
FROM dockerfile/java:oracle-java7

# Install Kibana
RUN \
  cd /tmp && \
  wget https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-BETA2.tar.gz && \
  tar xvzf kibana-4.0.0-BETA2.tar.gz && \
  rm -f kibana-4.0.0-BETA2.tar.gz && \
  mv /tmp/kibana-4.0.0-BETA2 /kibana

# Mount kibana.yml config
ADD config/kibana.yml /kibana/config/kibana.yml

# Define default command.
CMD ["/kibana/bin/kibana"]

EXPOSE 5061
