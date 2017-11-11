#!/bin/bash

. ./vars.sh

if [ ! -f "${JARFILE}" ]; then
    wget -O ${FORGEINSTALLER} https://files.minecraftforge.net/maven/net/minecraftforge/forge/${FORGEVERSION}/${FORGEINSTALLER}
    java -jar ${FORGEINSTALLER} --installServer
    rm ${FORGEINSTALLER}
    rm ${FORGEINSTALLER}.log
fi