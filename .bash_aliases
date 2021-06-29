# My Docker aliases / cheat-sheet
# --
# by Dragoljub Bogićević Apr 8 2020 ・ 2 min read
# https://dev.to/bogicevic7/my-docker-aliases-cheat-sheet-4bo9
# 
# Contents
# General
# Images
# Containers
# Networks
# Volumes
# Docker-Compose
# Note about pattern I tried to follow for aliases:
# 
# for docker commands first letter is always d, for docker compose is dc
# if command is related to images then next letter of alias is i, for containers is c and so on...
# following this pattern I found it pretty easy to remember all aliases
# 

# some common general aliases
alias ll='ls -latF'
alias hi='history'
alias hs='history 31 | head -n 30'
alias sc='source ~/.bashrc'
# alias kubens='kubectl config set-context --current --namespace ' 
# alias kubectx='kubectl config use-context ' 

# alias k=kubectl
# complete -F __start_kubectl k

# source <(kubectl completion bash)                     # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
# echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.

export DENO_INSTALL="/root/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin

# Terraform
alias tf='terraform'
alias tfa='time terraform apply && say "Terraform has completed"' # The 'say' command may not be available on all *nix systems.
alias tfd='terraform-docs'  # 'terraform-docs' command generates documentation from your TF code
alias tfg='terraform graph -draw-cycles | dot -Tpng > graph.png; open graph.png'
alias tfi='terraform init --upgrade'
alias tfp='echo running terraform get update then plan; terraform get -update && terraform plan -out /tmp/zplan'
alias tfv='terraform validate'

# General
alias dve="docker -v"
alias dl="docker login --username=dragol" 
# Explanation
# dve - prints out current docker version
# dl - docker login, will prompt you for password

# Images
alias dil="docker images"
alias dip="docker image prune -f"
# Explanation
# dil - list all docker images available on my machine
# dip - remove all dangling images -f is flag for force

# Containers
alias dcl="docker ps"
alias dcla="docker ps -a"
alias dcp="docker container prune -f"
alias dci="docker inspect"
alias dciip="docker inspect -f \"{{ .NetworkSettings.IPAddress }}\""
alias dcs="docker start"
alias dcd="docker down"
alias dcr="docker restart"
# Explanation
# dcl - list running containers
# dcla - list all containers
# dcp - remove all dangling containers
# dci - here you need to pass container id in order to get various information about particular container
# dciip - returns container IP address
# dcs - here you need to pass container id in order to start container
# dcd - here you need to pass container id in order to stop container
# dcr - here you need to pass container id in order to restart container

# Networks
alias dnl="docker network ls"
alias dni="docker network inspect"
alias dnrm="docker network rm"
alias dnp="docker network prune -f"
# Explanation
# dnl - list networks
# dni - here you need to pass network id in order to see it's details
# dnrm - here you need to pass network id in order to delete it
# dnp - remove all dangling networks

# Volumes
alias dvc="docker volume create"
alias dvl="docker volume ls"
alias dvrm="docker volume rm"
alias dvp="docker volume prune -f"
alias dvi="docker volume inspect"
# Explanation
# dvc - here you need to pass volume name in order to create it
# dvl - list volumes
# dvrm - here you need to pass volume id in order to delete it
# dvp - remove all dangling volumes
# dvi - here you need to pass volumeid in order to see it's details

# Docker-Compose
alias dcv="docker-compose -v"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dcb="docker-compose build --no-cache"
alias dcc="docker-compose config"
# Explanation
# dcv - prints out docker compose version
# dcu - start docker compose
# dcd - stop docker compose
# dcb - new docker compose build from ground up
# dcc - check if docker-compose.yml file is valid
