# Set the base image
FROM lsiobase/alpine

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

ADD https://raw.githubusercontent.com/thomasvt1/HomeAssistant/requirements/requirements.txt /

# Update application repository list and install the HASS server. 
RUN apk add --no-cache git mariadb-client-libs python3 ca-certificates libffi-dev libssl1.0 libressl-dev && \
    pip3 install --upgrade --no-cache-dir pip && \
    apk add --no-cache --virtual=build-dependencies build-base linux-headers python3-dev tzdata mariadb-dev && \
    pip3 install --no-cache-dir git+git://github.com/home-assistant/home-assistant.git@dev && \
    pip3 install --no-cache-dir -r requirements.txt && \
    apk del build-dependencies && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

	
# Expose default port
EXPOSE 8123

CMD ["hass"]
