# Set the base image
FROM alpine:latest

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

RUN apk add --update --no-cache python3 && \
    find / -type d -name __pycache__ -exec rm -r {} +   && \
    rm -r /usr/lib/python*/ensurepip                    && \
    rm -r /usr/lib/python*/lib2to3                      && \
    rm -r /usr/lib/python*/turtledemo                   && \
    rm -r /usr/lib/python*/idlelib                      && \
    rm /usr/lib/python*/turtle.py                       && \
    rm /usr/lib/python*/webbrowser.py                   && \
    rm /usr/lib/python*/doctest.py                      && \
    rm /usr/lib/python*/pydoc.py                        && \
    rm -rf /root/.cache /var/cache /usr/share/terminfo

# Update application repository list and install the Redis server. 
RUN \
	apk add --update linux-headers gcc build-base libffi-dev openssl-dev ffmpeg nmap libssl1.0 autoconf mariadb-dev && \
	
	pip3 install jsonrpc-websocket && \
	pip3 install async_timeout && \
	pip3 install jsonrpc-async && \
	pip3 install aiohttp_cors && \
	pip3 install python-miio && \
	pip3 install mysqlclient && \
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
