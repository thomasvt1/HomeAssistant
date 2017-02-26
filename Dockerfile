# Set the base image
FROM python:slim

# Dockerfile author / maintainer 
MAINTAINER Thomas <thomasvt@me.com>

# Update application repository list and install the Redis server. 
RUN adduser --system homeassistant
RUN mkdir /srv/homeassistant
RUN chown homeassistant:homeassistant /srv/homeassistant
RUN su -s /bin/bash homeassistant
RUN virtualenv -p python3 /srv/homeassistant
RUN source /srv/homeassistant/bin/activate
RUN pip3 install --upgrade homeassistant
RUN su -u homeassistant -H /srv/homeassistant/bin/hass
	

# Expose default port
EXPOSE 8123 8123

CMD ["hass -v"]
