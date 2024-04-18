#!/bin/bash

service nginx status >/dev/null
if [ $? -eq 0 ]; then
    echo "nginx server is running successfully"
else
    echo "nginx server is not running...Do you wanna start it?? use this cmd: service nginx start"
fi
