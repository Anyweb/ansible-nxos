# Ansible - NXOS

Kickstart your Cisco NXOS automation journey with Ansible. This project will help you get started
your Network Automation journey by show casing a simple Ansible setup which you can run in
a [VSCode Devcontainer](https://code.visualstudio.com/docs/devcontainers/containers)
or on any Linux machine with Python ^3.11 installed. It includes a couple of playbooks
which are used to demonstrate how easy it can be to write automation tasks for NXOS in Ansible.

## Installation

There are two ways how you can make use of this project. You can run in it in a
[VSCode Devcontainer](https://code.visualstudio.com/docs/devcontainers/containers)
or you can install all dependencies directly on your Linux host.

### Getting the code

To get the code simply clone it from Github or GitLab

```bash
git clone https://gitlab.com/anyweb/cisco-code-exchange/ansible-nxos.git
```

### VSCode Devcontainer

To use this project with the pre-configured VSCode Devcontainer you must make sure that
you have the [pre-requisites](https://code.visualstudio.com/docs/devcontainers/tutorial) installed.
After that just go to the project folder where you cloned this project into and open VSCode

```bash
cd ansible-nxos
code .
```

Once VSCode is open you can start the Devcontainer with:

1. Hit **Ctrl-Shift-p** on your keyboard to launch the command prompt.
2. Search for **Dev Containers: Reopen in Container** or **Dev Containers: Rebuild Container**
   in the search bar and hit **enter**

A container with all dependencies installed will be built and started so you can get started
without thinking about it too much.

### Linux

If you don't want to or can't use VSCode Devcontainer you still can make use of this project
by following these steps.

### With poetry

If [Poetry](https://python-poetry.org/) is available on your system, you can install
dependencies with:

```bash
poetry install --no-root
ansible-galaxy collection install -r ./requirements_ansible.yml --force
```

### Without poetry

Otherwise you can use [Pip](https://pip.pypa.io/en/stable/user_guide/#) to install
all dependencies with:

```bash
pip install -r ./requirements_python-dev.txt
ansible-galaxy collection install -r ./requirements_ansible.yml --force
```

## Configuration

This project uses the NX-API make sure that it is enabled on your switch:

```cli
nxos# configure terminal
nxos(config)# feature nxapi
```

The user name and password can be passed to ansible via environment variables.

```bash
export NXOS_USER=my-api-user
export NXOS_PASSWORD=my-super-secure-password
```

## Usage

### DevNet Sandbox

To try out this project you can use the [Cisco NX-OS Sandbox Lab](https://sbx-nxos-mgmt.cisco.com/).
Sandbox details such as username & password can be found [here](https://devnetsandbox.cisco.com/DevNet/catalog/Open-NX-OS-Programmability).

## Author(s)

This project was written and is maintained by the following individuals:

- Stephan Lüscher <stephan.luescher@anyweb.ch>
