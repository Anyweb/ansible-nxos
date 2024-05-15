#!/bin/bash
cat <<EOM
install-dev-tools.sh
=============================================
This script customizes the devcontainer setup
=============================================
EOM
# Bash colors
RED="\e[31m"
YELLOW="\e[33m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

## Update system
echo ""
echo -e "${YELLOW}Updating OS${ENDCOLOR}"
echo ""
sudo apt-get update && sudo apt-get upgrade -y

## Install additional tools
echo ""
echo -e "${YELLOW}Installing additional tools${ENDCOLOR}"
echo ""
sudo apt-get -y install --no-install-recommends git-extras gnupg2
### git-cliff -> version specified in devcontainer.json
GIT_CLIFF_SOURCE="https://github.com/orhun/git-cliff/releases/download/v${GIT_CLIFF_VERSION}/git-cliff-${GIT_CLIFF_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
GIT_CLIFF_TMP="/tmp/git-cliff.tar.gz"
wget -O $GIT_CLIFF_TMP $GIT_CLIFF_SOURCE
tar -xf $GIT_CLIFF_TMP -C /tmp
sudo cp /tmp/git-cliff-$GIT_CLIFF_VERSION/git-cliff* /usr/bin

# Add git commit template
echo ""
echo -e "${YELLOW}Configuring git${ENDCOLOR}"
echo ""
git config --local commit.template .gitmessage

# Install python dependencies
echo ""
echo -e "${YELLOW}Installing project dependencies${ENDCOLOR}"
echo ""
poetry install --no-root

# Install ansible dependencies
echo ""
echo -e "${YELLOW}Installing ansible dependencies${ENDCOLOR}"
echo ""
ansible-galaxy collection install -r ./requirements_ansible.yml --force

# Finish
echo ""
echo -e "${GREEN}Done. Happy coding!${ENDCOLOR}"
echo ""