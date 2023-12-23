# Mininet

We will install mininet in `Proxmox`

## Setup

http://mininet.org/download/

### Download

https://github.com/mininet/mininet/releases/

In `proxmox cli`

```bash
Download
wget https://github.com/mininet/mininet/releases/download/2.3.0/mininet-2.3.0-210211-ubuntu-20.04.1-legacy-server-amd64-ovf.zip
# Unzip
mkdir mininet
unzip mininet-2.3.0-210211-ubuntu-20.04.1-legacy-server-amd64-ovf.zip -d mininet/
# Import
qm importovf 200 mininet-2.3.0-210211-ubuntu-20.04.1-legacy-server-amd64.ovf local-lvm
```

### Login

Username: `mininet`
Password: `mininet`

## Start

http://mininet.org/walkthrough/
