## Kibana Dockerfile

This repository contains a **Dockerfile** for the latest release of [Kibana](http://www.elasticsearch.org/overview/kibana/), which is currently version 4 beta. 

### Base Docker Image

* [dockerfile/java:oracle-java7](http://dockerfile.github.io/#/java)

### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/eliotk/docker-kibana/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull eliotk/docker-kibana`

   (alternatively, you can build an image from the Dockerfile: `docker build -t="eliotk/docker-kibana" github.com/eliotk/docker-kibana`)

### Usage

To start a Kibana container, run:

`docker run -d -p 5601:5601 eliotk/docker-kibana`

Kibana needs to use the 1.4 version of elasticsearch.

To run the Kibana container with a linked version of elasticsearch 1.4, first run an elasticsearch Docker container named "elasticsearch".

Pull the dockerfile/elasticsearch image if you don't have the latest 1.4 version: `docker pull dockerfile/elasticsearch`

`docker run -d -p 9200:9200 -p 9300:9300 --name elasticsearch dockerfile/elasticsearch`

Then run a Kibana container with a link to the elasticsearch container:

`docker run -d -P --name kibana -p 5601:5601 --link elasticsearch:elasticsearch eliotk/docker-kibana`

After few seconds, open `http://<host>:5601` to see the result.
