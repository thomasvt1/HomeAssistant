# Set the base image
FROM lsiobase/alpine

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

ADD https://raw.githubusercontent.com/home-assistant/home-assistant/master/requirements_all.txt /

# Update application repository list and install the HASS server. 
RUN apk add --no-cache git mariadb-client-libs python3 autoconf nmap ca-certificates glib-dev libffi-dev jpeg-dev eudev-dev zlib-dev py3-lxml libssl1.0 libressl-dev && \
    pip3 install --upgrade --no-cache-dir pip && \
    apk add --no-cache --virtual=build-dependencies build-base linux-headers python3-dev tzdata mariadb-dev && \
    pip3 install --no-cache-dir --no-use-pep517 homeassistant && \
    pip3 install --no-cache-dir --no-use-pep517 -r requirements_all.txt && \
    apk del build-dependencies && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

	
# Expose default port
EXPOSE 8123

CMD ["hass"]
