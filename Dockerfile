# Set the base image
FROM lsiobase/alpine:3.10

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

ADD https://raw.githubusercontent.com/home-assistant/core/master/requirements.txt /
ADD https://raw.githubusercontent.com/home-assistant/home-assistant/master/requirements_all.txt /
ADD https://raw.githubusercontent.com/home-assistant/core/dev/homeassistant/package_constraints.txt homeassistant/

# Update application repository list and install the HASS server. 
RUN apk add --no-cache ffmpeg-dev git mariadb-connector-c-dev python3 autoconf nmap ca-certificates glib-dev libffi-dev jpeg-dev eudev-dev zlib-dev py3-lxml libssl1.1 libressl-dev && \
    pip3 install --upgrade --no-cache-dir pip cython && \
    apk add --no-cache --virtual=build-dependencies build-base linux-headers python3-dev tzdata mariadb-dev cmake && \
    pip3 install --no-cache-dir -r requirements_all.txt && \
    pip3 install --no-cache-dir homeassistant && \
    apk del build-dependencies && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

	
# Expose default port
EXPOSE 8123

CMD ["hass"]
