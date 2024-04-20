#!/bin/bash
TOOLS='unzip terraform packer docker kops jq'

function apt_tools {
    apt update >/dev/null 2>&1
    apt install -y unzip jq
}

tform() {
    wget https://releases.hashicorp.com/terraform/1.8.1/terraform_1.8.1_linux_amd64.zip
    unzip terraform_1.8.1_linux_amd64.zip
    mv terraform /usr/local/bin
    terraform version
}

packerr() {
    wget https://releases.hashicorp.com/packer/1.10.2/packer_1.10.2_linux_amd64.zip
    unzip packer_1.10.2_linux_amd64.zip
    mv packer /usr/local/bin
    packer version
}

kopss() {
    wget https://github.com/kubernetes/kops/releases/download/v1.28.4/kops-linux-amd64
    mv kops-linux-amd64 /usr/local/bin/kops && chmod 777 /usr/local/bin/kops
    kops version
}

dockerr() {
    curl https://get.docker.com | bash
}

for tool in $TOOLS; do
    $tool version 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "$tool is already installed"
    else
        echo "Let's install $tool"
        if [ $tool = 'unzip' -o $tool = 'jq' ]; then
            apt_tools
        elif [ $tool = 'terraform' ]; then
            tform
        elif [ $tool = 'packer' ]; then
            packerr
        elif [ $tool = 'kops' ]; then
            kopss
        elif [ $tool = 'docker' ]; then
            dockerr
        else
            echo "All Tools are Installed"
        fi

    fi
done
