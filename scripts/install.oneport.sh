#!/bin/bash
git_user_name="$(git config user.name || echo '')"
git_user_email="$(git config user.email || echo '')"
read -e -p "Enter Project Port Prefix (e.g. 401, 402...): " -i 401 port_prefix
read -e -p "Enter Project Name (folder will be mounted to \"/projects/<name>\"): " -i test project_name
read -e -p "Enter Project Password: " password
read -e -p "Bob symbol?" -i "→" bob
read -e -p "Git user name? " -i "${git_user_name}" git_user_name
read -e -p "Git user email? " -i "${git_user_email}" git_user_email
bob_color=93 && \
project_path="/projects/$project_name" && \
container_name="coder-$project_name" && \
echo "Project files located in $project_path" && \
echo "Container will be named $container_name" && \
sudo docker pull choephix2/coder:latest && \
sudo docker run -dit \
--restart unless-stopped --privileged \
--name "$container_name" \
--hostname "$project_name" \
-e PUID=1000 -e PGID=1000 -e TZ=Europe/Sofia \
-e BOB="${bob}" -e BOB_COLOR=${bob_color} \
-e GIT_USER_EMAIL="${git_user_email}" \
-e GIT_USER_NAME="${git_user_name}" \
-e AUTOPULL_SETTINGS=true \
-e PASSWORD="${password}" \
-p 0.0.0.0:${port_prefix}00:8443 \
-v "${project_path}":/home/coder/project \
choephix2/coder:latest
