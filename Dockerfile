# Set the base image
FROM lsiobase/alpine

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

ADD https://raw.githubusercontent.com/home-assistant/home-assistant/master/requirements_all.txt /

# Update application repository list and install the HASS server. 
RUN apk add --no-cache git python3 ca-certificates libffi-dev jpeg-dev py3-openzwave-lib zlib-dev py3-lxml libssl1.0 libressl-dev && \
    pip3 install --upgrade --no-cache-dir pip && \
    apk add --no-cache --virtual=build-dependencies build-base linux-headers python3-dev tzdata && \
    pip3 install --no-cache-dir homeassistant && \
    pip3 install --no-cache-dir -r requirements_all.txt && \
    apk del build-dependencies && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

	
# Expose default port
EXPOSE 8123

CMD ["hass"]
