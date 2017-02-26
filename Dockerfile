# Set the base image
FROM python:3.5-slim

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

# Update application repository list and install the Redis server. 
RUN \
	apt-get update && apt-get install -y python-virtualenv && \
	addgroup homeassistant && \
	adduser --system homeassistant && \
	usermod -g homeassistant homeassistant &&\
	mkdir /srv/homeassistant && \
	groups homeassistant && \
	chown homeassistant:homeassistant /srv/homeassistant && \
	su -s /bin/bash homeassistant && \
	virtualenv -p python3 /srv/homeassistant && \
	source /srv/homeassistant/bin/activate && \
	pip3 install --upgrade homeassistant && \
	su -u homeassistant -H /srv/homeassistant/bin/hass
	

# Expose default port
EXPOSE 8123 8123

CMD ["hass -v"]
