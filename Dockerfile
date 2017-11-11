FROM java:8-jre

LABEL Tim Turner <timdturner@gmail.com>

# Updating container
RUN apt-get update && \
	apt-get upgrade --yes --force-yes && \
	apt-get clean && \ 
	rm -rf /var/lib/apt/lists/*

WORKDIR /minecraft

USER root

RUN useradd -m -U minecraft

# Load in all of our config files
ADD ./scripts/install.sh /minecraft/install.sh
ADD ./scripts/start.sh /minecraft/start.sh
ADD ./scripts/vars.sh /minecraft/vars.sh
ADD ./eula.txt /minecraft/eula.txt
#ADD ./libraries/ /minecraft/libraries/
#ADD ./mods/ /minecraft/mods/
#ADD ./config/ /minecraft/config/
ADD ./ops.json /minecraft/ops.json
ADD ./server.properties /minecraft/server.properties
ADD ./whitelist.json /minecraft/whitelist.json

# Fix permissions
RUN chmod u+x /minecraft/install.sh /minecraft/start.sh /minecraft/vars.sh && \
    chown -R minecraft:minecraft /minecraft

# Download Mods
RUN wget -c https://www.massivedeeps.com/minecraft-server/massivedeeps-minecraft.zip -O massivedeeps.zip && \
	unzip massivedeeps.zip && \
	rm massivedeeps.zip

#USER minecraft

# Download and Install Minecraft server
RUN /minecraft/install.sh

RUN chown -R minecraft:minecraft /minecraft

# 25565 is for minecraft
EXPOSE 25565

# /data contains static files and database
VOLUME ["/minecraft/world", "/minecraft/backups"]

# /start runs the server
ENTRYPOINT ["/minecraft/start.sh"]

ENV UID=1000 GID=1000