#!/bin/bash

USER1=$1
USER2=$2
USER3=$3

sudo useradd -m $USER1 --shell /bin/bash
sudo useradd -m $USER2 --shell /bin/bash
sudo useradd -m $USER3 --shell /bin/bash
