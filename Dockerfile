# Set the base image
FROM python:3.6-alpine

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

# Update application repository list and install the Redis server. 
RUN \
	apk add --update linux-headers gcc build-base libffi-dev openssl-dev ffmpeg nmap libssl1.0 autoconf && \
	adduser -S homeassistant && \
	
	pip3 install jsonrpc-websocket && \
	pip3 install async_timeout && \
	pip3 install jsonrpc-async && \
	pip3 install aiohttp_cors && \
	pip3 install python-miio && \
	pip3 install fuzzywuzzy && \
	pip3 install gTTs-token && \
	pip3 install voluptuous &&\
	pip3 install paho-mqtt && \
	pip3 install pywebpush && \
	pip3 install zeroconf && \
	pip3 install requests && \
	pip3 install netdisco && \
	pip3 install mutagen && \
	pip3 install aiohttp && \
	pip3 install chardet && \
	pip3 install jinja2 && \
	pip3 install pyyaml && \
	pip3 install typing && \
	pip3 install astral && \	
	pip3 install pyfttt && \
	pip3 install distro && \
	pip3 install PyJWT && \
	pip3 install pytz && \
	pip3 install yarl && \
	pip3 install pytz && \
	
	
	pip3 install --upgrade homeassistant
	
# Expose default port
EXPOSE 8123 8123

CMD ["hass"]
