#!/bin/bash

. ./vars.sh

java -server -Xms${MIN_RAM} -jar ${FORGEJAR} nogui