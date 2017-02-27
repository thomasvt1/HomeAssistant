# Set the base image
FROM python:3.5-slim

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

# Update application repository list and install the Redis server. 
RUN \
	addgroup homeassistant && \
	adduser --system homeassistant && \
	usermod -g homeassistant homeassistant &&\
	
	mkdir /srv/homeassistant && \
	groups homeassistant && \
	chown homeassistant:homeassistant /srv/homeassistant && \

	pip3 install --upgrade homeassistant && \
	

# Expose default port
EXPOSE 8123 8123

CMD ["./srv/homeassistant/bin/hass"]
