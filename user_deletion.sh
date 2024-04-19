#!/bin/bash

USER1=$1
USER2=$2
USER3=$3

sudo userdel -r $USER1
sudo userdel -r $USER2
sudo userdel -r $USER3
