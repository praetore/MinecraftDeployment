#!/bin/sh
command -v java -version >/dev/null 2>&1 || { sudo apt-get install openjdk-7-jre; }

# Prepare MC client jar
if [ ! -f ./Minecraft.jar ];
then
	wget https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar;
fi

if [ ! -x ./Minecraft.jar ];
then
	chmod +x Minecraft.jar;
fi

# Start Minecraft client
java -jar Minecraft.jar
