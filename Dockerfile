# Set the base image
FROM python:3.5-alpine

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

# Update application repository list and install the Redis server. 
RUN \
	apk add --update linux-headers && \
	adduser -S homeassistant && \
	
	pip3 install netdisco==0.8.3 && \
	pip3 install --upgrade homeassistant && \
	
# Expose default port
EXPOSE 8123 8123

CMD ["hass"]
