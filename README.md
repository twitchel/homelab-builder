# Homelab Builder

The goal behind this project is to allow me to spin up a homelab stack on one or more proxmox hosts.

## Requirements

### Local machine

This project is designed to be orchestrated from a Mac or a Debian/Ubuntu based system (that includes Ubuntu on WSL for Windows).

This setup requires the following installed at a minimum
- git
- make

There is a `make` target to install the remaining dependencies (suited for MacOS and Debian/Ubuntu based systems).

```shell
make install
```

### Hosting Environment

This setup is designed to be rolled out as VM's/Nodes on a Proxmox Virtual Environment node/cluster

This has been tested with Proxmox PVE 8.3.1.

## Configuration

Once you've installed the dependencies, you can run the configuration wizard to allow you to customise your environment.

These changes will be persisted to a JSON file in this project root, and then baked into the relevant templates.

```shell
make configure
```

## Bootstrapping Infrastructure

You can run the below command once you've configured your environment

```shell
make infra-build
```

This will use the currently set environment to bake the swarm nodes (VM's) in your promox cluster, and install all required dependencies

## Stack Management

You can start your stack by running the below
