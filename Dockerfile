# Set the base image
FROM python:slim

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>



# Update application repository list and install the Redis server. 
RUN \
	useradd -rm homeassistant && \
	cd /srv && \
	mkdir homeassistant && \
	chown homeassistant:homeassistant homeassistant && \
	pip3 install homeassistant && \
	hass --open-ui
	

# Expose default port
EXPOSE 8123 8123
