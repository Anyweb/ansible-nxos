# Ansible - NXOS

Kickstart your Cisco NXOS automation journey with Ansible. This project will help you get started
your Network Automation journey by show casing a simple Ansible setup which you can run in
a [VSCode Devcontainer](https://code.visualstudio.com/docs/devcontainers/containers)
or on any Linux machine with Python ^3.11 installed. It includes a couple of playbooks
which are used to demonstrate how easy it can be to write automation tasks for NXOS in Ansible.

## Installation

There are two ways how you can make use of this project. You can run it in a
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

Once the VSCode window has opened you can start the Devcontainer with:

1. Hit **Ctrl-Shift-p** on your keyboard to launch the command prompt.
2. Search for **Dev Containers: Reopen in Container** or **Dev Containers: Rebuild Container**
   in the search bar and hit **enter**

A container with all dependencies installed will be built and started so you can get started
without thinking about it too much.

### Linux

If you don't want to or can't use VSCode Devcontainer you still can make use of this project by
following these steps.

### With poetry

If [Poetry](https://python-poetry.org/) is available on your system, you can install dependencies
with:

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

### NX-OS Authentication

All playbooks in this project connect via NX-API to your switches. Make sure that this
feature is enabled.

```cli
nxos# configure terminal
nxos(config)# feature nxapi
```

User name and password for authentication can be passed to ansible via environment variables.

```bash
export NXOS_USER="my-api-user"
export NXOS_PASSWORD="my-super-secure-password"
```

### NX-OS Backup Location

Playbooks which provide a backup functionality will save the backup to the
`./backup` folder. You can overwrite this behavior with the `NXOS_BACKUP_LOCATION` environment
variable.

```bash
export NXOS_BACKUP_LOCATION="/path/to/my/backup/location"
```

### NX-OS Configuration File

Playbook which provide a configuration functionality will load the configuration variables
from the [nxos-config.yml](./vars/nxos-config.yml) file. You can overwrite this behavior
with the `NXOS_CONFIGURATION_FILE` environment variable.

```bash
export NXOS_CONFIGURATION_FILE="/path/to/my/configuration/file"
```

## Usage

The following playbooks are available for demonstration purposes:

<!-- markdownlint-disable MD013 -->

| Playbook                                               | Description                         | Configuration environment variable | Configuration default                                                             |
| ------------------------------------------------------ | ----------------------------------- | ---------------------------------- | --------------------------------------------------------------------------------- |
| [backup_config.yml](./playbooks/backup_config.yml)     | Backup running-config to file       | `NXOS_BACKUP_LOCATION`             | `./backup` -> [NX-OS Backup Location](#nx-os-backup-location)                     |
| [configure_vlans.yml](./playbooks/configure_vlans.yml) | Configure VLANs                     | `NXOS_CONFIGURATION_FILE`          | `./vars/nxos-config.yml` -> [NX-OS Configuration File](#nx-os-configuration-file) |
| [configure_vrf.yml](./playbooks/configure_vrf.yml)     | Configure VRFs                      | `NXOS_CONFIGURATION_FILE`          | `./vars/nxos-config.yml` -> [NX-OS Configuration File](#nx-os-configuration-file) |
| [gather_facts.yml](./playbooks/gather_facts.yml)       | Gather and display all NX-OS facts  |                                    |                                                                                   |
| [show_vlans.yml](./playbooks/show_vlans.yml)           | Display output of `show vlan brief` |                                    |                                                                                   |
| [show_vrfs.yml](./playbooks/show_vrfs.yml)             | Display output of `show vrf`        |                                    |                                                                                   |

<!-- markdownlint-enable MD013 -->

To execute a playbook you can use the command `ansible-playbook playbooks/{{ playbook_name }}`.

**_Example:_**

```bash
ansible-playbook playbooks/show_vlans.yml
```

### DevNet Sandbox

To try out this project you can use the [Cisco NX-OS Sandbox Lab](https://sbx-nxos-mgmt.cisco.com/).
Sandbox details such as username & password can be found [here](https://devnetsandbox.cisco.com/DevNet/catalog/Open-NX-OS-Programmability).

## Author(s)

This project was written and is maintained by the following individuals:

- Stephan Lüscher <stephan.luescher@anyweb.ch>
