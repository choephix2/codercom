#! /bin/bash
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
extensions_path="/vscode/extensions" && \
echo "Project files located in $project_path" && \
echo "Container will be named $container_name" && \
sudo docker run -dit \
--restart unless-stopped --privileged \
--name "$container_name" \
--hostname "$project_name" \
-e PUID=1000 -e PGID=1000 -e TZ=Europe/Sofia \
-e BOB="${bob}" -e BOB_COLOR=${bob_color} \
-e GIT_USER_EMAIL="${git_user_email}" \
-e GIT_USER_NAME="${git_user_name}" \
-e PASSWORD="${password}" \
-p 0.0.0.0:${port_prefix}00:8443 \
-p 0.0.0.0:${port_prefix}80:80 \
-p 0.0.0.0:${port_prefix}81:81 \
-p 0.0.0.0:${port_prefix}82:82 \
-p 0.0.0.0:${port_prefix}83:83 \
-p 0.0.0.0:${port_prefix}88:8080 \
-p 0.0.0.0:${port_prefix}30:3000 \
-p 0.0.0.0:${port_prefix}32:5432 \
-p 0.0.0.0:${port_prefix}36:3306 \
-p 0.0.0.0:${port_prefix}50:5000 \
-p 0.0.0.0:${port_prefix}90:9000 \
-p 0.0.0.0:${port_prefix}22:22 \
-v "${project_path}":/workspace \
-v "${extensions_path}":/vscode/extensions \
choephix2/coder:latest --allow-http
