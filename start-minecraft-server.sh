#!/bin/sh

SERVERNAME="Project 5-6 Minecraft Server"

# Install prerequisites
command -v java -version >/dev/null 2>&1 || { sudo apt-get install openjdk-7-jre; }
command -v git --version >/dev/null 2>&1 || { sudo apt-get install git-core; }
command -v screen -v >/dev/null 2>&1 || { sudo apt-get install screen; }

# Prepare MC Spigot server
if [ ! -f ./spigot*.jar ];
then
	wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar;
	java -jar BuildTools.jar;
	sed -i 's/\(eula=\)false/\1TRUE/' eula.txt;
fi

if [ ! -x ./spigot*.jar ];
then
	chmod +x spigot*.jar;
fi

# Start server
screen -dmS "$SERVERNAME" java -Xms512M -Xmx1024M -jar spigot*.jar

# Notify of server start
notify-send "$SERVERNAME started"
