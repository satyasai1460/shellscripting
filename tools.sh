#!/bin/bash
TOOLS='unzip terraform packer docker kops jq'
for tool in $TOOLS; do
    $tool version >/dev/null
    if [ $? -eq 0 ]; then
        echo "$tool is already installed"
    else
        echo "Let's install $tool"
    fi
done
