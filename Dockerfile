# Set the base image
FROM python:3.5-alpine

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

# Update application repository list and install the Redis server. 
RUN \
	apk add --update build-base gcc abuild binutils binutils-doc gcc-doc && \
	adduser -S homeassistant && \
	
	pip3 install netdisco==0.8.3 && \
	pip3 install --upgrade homeassistant && \
	
	ls /srv/homeassistant &&\
	
	ls /home/homeassistant
	

# Expose default port
EXPOSE 8123 8123

CMD ["hass"]
