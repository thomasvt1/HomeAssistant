# Set the base image
FROM python:3.5-alpine

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

# Update application repository list and install the Redis server. 
RUN \
	apk add --update linux-headers gcc build-base libffi-dev openssl-dev && \
	adduser -S homeassistant && \
	
	pip3 install netdisco==0.8.3 && \
	pip3 install pywebpush==0.6.1 && \
	pip3 install fuzzywuzzy==0.15.0 && \
	pip3 install jsonrpc-async==0.4 && \
	pip3 install jsonrpc-websocket==0.5 && \
	pip3 install gTTs-token==1.1.1 && \
	
	pip3 install --upgrade homeassistant
	
# Expose default port
EXPOSE 8123 8123

CMD ["hass"]
