# Set the base image
FROM python:3.7.13-alpine

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

# Update application repository list and install the Redis server. 
RUN \
	apk add --update linux-headers gcc build-base libffi-dev openssl-dev && \
	adduser -S homeassistant && \
	
	pip3 install netdisco==1.0.0rc3 && \
	pip3 install pywebpush==0.6.1 && \
	pip3 install fuzzywuzzy==0.15.0 && \
	pip3 install jsonrpc-async==0.6 && \
	pip3 install jsonrpc-websocket==0.5 && \
	pip3 install gTTs-token==1.1.1 && \
	pip3 install paho-mqtt==1.2.2 && \
	pip3 install aiohttp_cors==0.5.2 && \
	pip3 install zeroconf==0.19.0 && \
	pip3 install astral==1.4 && \
	pip3 install mutagen==1.36.2 && \
	pip3 install distro==1.0.4 && \
	pip3 install pyfttt==0.3 && \
	pip3 install PyJWT==1.4.2 && \
	
	pip3 install --upgrade homeassistant
	
# Expose default port
EXPOSE 8123 8123

CMD ["hass"]
