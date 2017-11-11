#!/bin/bash

export MCVER="1.12.2"
export JARFILE="minecraft_server.${MCVER}.jar"
export LAUNCHWRAPPERVERSION="1.12"
export LAUNCHWRAPPER="net/minecraft/launchwrapper/${LAUNCHWRAPPERVERSION}/launchwrapper-${LAUNCHWRAPPERVERSION}.jar"
export FORGEVERSION="1.12.2-14.23.0.2537"
export FORGEJAR="forge-${FORGEVERSION}-universal.jar"
export FORGEINSTALLER="forge-${FORGEVERSION}-installer.jar"

# Default arguments for JVM

## Copy following lines into settings-local.sh to create local config file which overrides default settings given here
export JAVACMD="java"
export MIN_RAM="2048M"        # -Xms
export MAX_RAM="10240M"       # -Xmx
export JAVA_PARAMETERS="-XX:+UseParNewGC -XX:+CMSIncrementalPacing -XX:+CMSClassUnloadingEnabled -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10"