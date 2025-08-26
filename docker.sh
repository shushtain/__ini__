#!/bin/bash

#
# DOCKER
#

do_docker() {
    local packages=(
        docker
    )

    yay -S --needed "${packages[@]}"

    sudo systemctl enable --now docker.service
    sudo usermod -aG docker "$USER"
}

do_containers() {
    docker container run --name explainshell -p 5000:5000 -d spaceinvaderone/explainshell
}

while true; do
    echo "Note: System needs to restart after installing Docker."
    read -r -p "Install Docker or set up containers? (d/c/n) " answer
    case $answer in
    [Dd]*)
        do_docker
        break
        ;;
    [Cc]*)
        do_containers
        break
        ;;
    [Nn]*) break ;;
    *) echo "Please answer Y/y or N/n." ;;
    esac
done
