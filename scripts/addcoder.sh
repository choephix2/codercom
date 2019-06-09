#!/bin/bash

git_user_name="$(git config user.name || echo '')"
git_user_email="$(git config user.email || echo '')"

ARG_CUSTOMIZE=$([ "$*" == *-c* ])
ARG_EXTRA_PORTS=$([ "$*" == *-p* ])
ARG_GIT_CONFIG=true

input() {
    echo -e -n "\033[1;94m- $1: \033[96m"
    if [[ -z $3 ]]
    then 
        read -e $2
    else
        read -e -i "$3" $2
    fi
    echo -e -n "\e[0;0m"
}

input_require() {
    input "$1" "$2" "$3"
    while [[ -z ${!2} ]]
    do 
        error "\033[1A\033[K""This is required input:"
        input "$1" "$2" "$3"
    done
}

error() { 
    echo -e "\033[91m$1"
}

output() {
    echo -e "\033[1A\033[K\033[0;96m$1\033[0m"
}

output() {
    echo -e "\033[0;94m- $1\033[0m"
}

input_require "Project name (alphanumeric)" project_name
input "Project password" password

project_path="/projects/$project_name" && \
container_name="coder-$project_name" && \
output "Host's project files will be located in \"$project_path\""
output "Container will be named \"$container_name\""

if $ARG_GIT_CONFIG
then
    input "Git user name" git_user_name "${git_user_name}"
    input "Git user email" git_user_email $git_user_email
fi

input_require "Enter Project Port Prefix (e.g. 401, 402...)" port_prefix
if $ARG_EXTRA_PORTS
then
    input "Enter Project Additional Ports (e.g. '88:8080 36:3306')" ports
fi

if $ARG_CUSTOMIZE
then
    input_require "Bob symbol?" bob →
    input_require "Bob color?" bob_color 93
fi

PORT_OPTIONS=""
ports="00:8443 $ports"
ports=$(echo $ports | tr " " "\n")
for port in $ports ; do PORT_OPTIONS="$PORT_OPTIONS -p 0.0.0.0:$port_prefix$port" ; done

echo -e "\033[33m"
docker pull choephix2/coder:latest
docker run -dit --restart unless-stopped \
      --name "coder-$project_name" \
      --hostname "$project_name" \
      -v "${project_path}":/home/coder/project \
      -e PUID=1000 -e PGID=1000 -e TZ=Europe/Sofia \
      -e BOB="${bob}" -e BOB_COLOR=${bob_color} \
      -e GIT_USER_EMAIL="${git_user_email}" \
      -e GIT_USER_NAME="${git_user_name}" \
      -e AUTOPULL_SETTINGS=false \
      -e PASSWORD=${password} \
      $PORT_OPTIONS \
      choephix2/coder 
