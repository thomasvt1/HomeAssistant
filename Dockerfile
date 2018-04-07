# Set the base image
FROM lsiobase/alpine.python

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

# Update application repository list and install the Redis server. 
RUN \
	apk add --update linux-headers gcc build-base libffi-dev ffmpeg nmap libssl1.0 autoconf mariadb-dev && \
	
	pip install jsonrpc-websocket && \
	pip install async_timeout && \
	pip install jsonrpc-async && \
	pip install aiohttp_cors && \
	pip install python-miio && \
	pip install mysqlclient && \
	pip install fuzzywuzzy && \
	pip install gTTs-token && \
	pip install voluptuous &&\
	pip install paho-mqtt && \
	pip install pywebpush && \
	pip install zeroconf && \
	pip install requests && \
	pip install netdisco && \
	pip install mutagen && \
	pip install aiohttp && \
	pip install chardet && \
	pip install jinja2 && \
	pip install pyyaml && \
	pip install typing && \
	pip install astral && \	
	pip install pyfttt && \
	pip install distro && \
	pip install PyJWT && \
	pip install pytz && \
	pip install yarl && \
	pip install pytz && \
	
	
	pip install --upgrade homeassistant
	
# Expose default port
EXPOSE 8123 8123

CMD ["hass"]
