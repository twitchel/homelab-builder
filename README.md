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

## Set environment

This setup supports multiple environments (for exanple, a production env vs a testing dev env). Each env supports its own infra + app configuration.

```shell
make set-env
```

## Bootstrapping Infrastructure

You can run the below command once you've configured your environment

```shell
make infra-build
```

This will use the currently set environment to bake the swarm nodes (VM's) in your promox cluster, and install all required dependencies

## Stack Management

You can deploy and boot your stack but running the following

```shell
make deploy
```

## Destroy Infrastrucfture

This will destroy the stack and all the nodes created in the initial bootstrap

> **WARNING, THIS WILL CAUSE DATA LOSS**

```shell
make infra-destroy
```

## Thanks
- Inspired by the geek cookbook's premix: https://github.com/geek-cookbook/premix
- A lot of information here: https://geek-cookbook.funkypenguin.co.nz/
- Icons from: https://github.com/NX211/homer-icons