#!/bin/bash
cd /home/container

export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

MODIFIED_STARTUP=$(echo $(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g'))
START_COMMAND=$(echo -e ${MODIFIED_STARTUP})
echo -e ":/home/container$ ${START_COMMAND}"

${MODIFIED_STARTUP}