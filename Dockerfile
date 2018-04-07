# Set the base image
FROM lsiobase/alpine

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

RUN apk add --no-cache python3-dev && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

# Update application repository list and install the Redis server. 
RUN apk add --no-cache git python3 ca-certificates && \
    addgroup -g ${GUID} hass && \
    adduser -h /data -D -G hass -s /bin/sh -u ${UID} hass && \
    pip3 install --upgrade --no-cache-dir pip && \
    apk add --no-cache --virtual=build-dependencies build-base linux-headers python3-dev tzdata && \
    cp "/usr/share/zoneinfo/${TIMEZONE}" /etc/localtime && echo "${TIMEZONE}" > /etc/timezone && \
    pip3 install --no-cache-dir homeassistant && \
    pip3 install --no-cache-dir home-assistant-frontend==20180310.0 sqlalchemy==1.2.2 distro==1.2.0 aiohttp_cors==0.6.0 jsonrpc-async==0.6 samsungctl[websocket]==0.7.1 pychromecast==2.0.0 paho-mqtt==1.3.1 rxv==0.5.1 jsonrpc-websocket==0.6 wakeonlan==1.0.0 websocket-client==0.37.0 && \
    apk del build-dependencies && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/
	
	
	pip3 install --upgrade homeassistant
	
# Expose default port
EXPOSE 8123

CMD ["hass"]
