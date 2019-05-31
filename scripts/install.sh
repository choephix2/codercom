#! /bin/bash
read -p "Enter Project Name (will match folder \"project-<name>\"): " project_name
read -p "Enter Project Port Prefix (e.g. 441, 442...): " port_prefix

project_path="/projects/$project_name"
container_name="coder-$project_name"

extensions_path="/home/coder/vscode-extensions"

echo "Project files located in $project_path"
echo "Container will be named $container_name"

docker run -dit \
-e PUID=1000 -e PGID=1000 -e TZ=Europe/Sofia \
-p 0.0.0.0:${port_prefix}00:8443 \
-p 0.0.0.0:${port_prefix}80:80 \
-p 0.0.0.0:${port_prefix}81:81 \
-p 0.0.0.0:${port_prefix}82:82 \
-p 0.0.0.0:${port_prefix}83:83 \
-p 0.0.0.0:${port_prefix}30:3000 \
-p 0.0.0.0:${port_prefix}32:5432 \
-p 0.0.0.0:${port_prefix}36:3306 \
-p 0.0.0.0:${port_prefix}50:5000 \
-p 0.0.0.0:${port_prefix}88:8080 \
-p 0.0.0.0:${port_prefix}90:9000 \
-p 0.0.0.0:${port_prefix}91:9001 \
-p 0.0.0.0:${port_prefix}92:9200 \
-p 0.0.0.0:${port_prefix}93:9300 \
-p 0.0.0.0:${port_prefix}22:22 \
-v ${project_path}:/workspace \
-v ${extensions_path}:/vscode/extensions \
--restart unless-stopped --privileged \
--hostname vm \
--name $container_name \
codercom/code-server:latest --allow-http
