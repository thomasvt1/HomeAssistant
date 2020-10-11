# Set the base image
FROM lsiobase/alpine:3.12

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

ADD https://raw.githubusercontent.com/thomasvt1/HomeAssistant/requirements/requirements.txt /

# Update application repository list and install the HASS server. 
RUN apk add --no-cache git mariadb-connector-c-dev python3 py3-pip ca-certificates libffi-dev libssl1.1 libressl-dev && \
    pip3 install --upgrade --no-cache-dir pip && \
    apk add --no-cache --virtual=build-dependencies build-base linux-headers python3-dev tzdata mariadb-dev && \
    pip3 install --no-cache-dir --pre homeassistant && \
    pip3 install --no-cache-dir -r requirements.txt && \
    apk del build-dependencies && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

	
# Expose default port
EXPOSE 8123

CMD ["hass"]
