
# Environment Setup

[![GitHub Super-Linter](https://github.com/open-homelab/dev-environment/workflows/Lint/badge.svg)](https://github.com/marketplace/actions/super-linter)

This project is to setup your local or server environment.

## Requirements

* git

## Fedora 36

### 1. Clone this repository

`git clone https://github.com/open-homelab/dev-environment.git`

### 2. Run bootstrap

Please be sure you read and understand what this script is installing first.

`./bootstrap`

### 3. Run ansible

As with the bootstrap, be sure to understand what this is changing in your system.

`task ansible:fedora36:local`

### 4. Reboot your system

`reboot`
