
# Environment Setup

[![GitHub Super-Linter](https://github.com/open-homelab/dev-environment/workflows/Lint/badge.svg)](https://github.com/marketplace/actions/super-linter)

This project is to setup your local or server environment.

# Table of Contents


<!-- vim-markdown-toc Marked -->

  * [Requirements](#requirements)
+ [How-To](#how-to)
  * [Fedora 36](#fedora-36)
    - [1. Clone this repository](#1.-clone-this-repository)
    - [2. Run bootstrap](#2.-run-bootstrap)
    - [3. Run ansible](#3.-run-ansible)
    - [4. Reboot your system](#4.-reboot-your-system)

<!-- vim-markdown-toc -->

## Requirements

* git

# How-To

## Fedora 36

### 1. Clone this repository

`git clone https://github.com/open-homelab/dev-environment.git`

### 2. Run bootstrap

Please be sure you read and understand what this script is installing first.

`./bootstrap.sh`

### 3. Run ansible

As with the bootstrap, be sure to understand what this is changing in your system.

`task ansible:fedora36:local`

### 4. Reboot your system

`reboot`
