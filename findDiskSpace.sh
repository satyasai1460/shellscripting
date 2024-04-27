#!/bin/bash

# 1.Total Space
# 2.File system
# 3.Used space
# 4.Used space percentage
# 5.Remaining space Available

TOTALSPACE=$(df -h | grep -i root | awk -F ' ' '{print $2}' | sed "s/G//g")
FILESYSTEM=$(df -h | grep -i root | awk -F ' ' '{print $1}')
USEDSPACE=$(df -h | grep -i root | awk -F ' ' '{print $3}' | sed "s/G//g")
USEDSPACEPERCENTAGE=$(df -h | grep -i root | awk -F ' ' '{print $5}' | sed "s/%//g")
REMAININGSPACEPERCENTAGE=$(expr 100 - ${USEDSPACEPERCENTAGE})
AVAILABLESPACE=$(df -h | grep -i root | awk -F ' ' '{print $4}' | sed "s/G//g")

echo "The Total space for the ${FILESYSTEM} filesystem was ${TOTALSPACE}G"
echo "The Space used by the filesystem  ${FILESYSTEM} was ${USEDSPACE}G i.e, (${USEDSPACEPERCENTAGE}%/100)"
echo "The Remaining Available Space was ${AVAILABLESPACE}G"
