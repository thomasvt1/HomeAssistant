# Set the base image
FROM python:slim

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>



# Update application repository list and install the Redis server. 
RUN \
	sudo useradd -rm homeassistant && \
	cd /srv && \
	sudo mkdir homeassistant && \
	sudo chown homeassistant:homeassistant homeassistant && \
	pip3 install homeassistant
	

# Expose default port
EXPOSE 8123 8123