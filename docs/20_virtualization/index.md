# Virtualization

Virtualization is the process of creating a virtual version of something, including virtual computer hardware platforms, storage devices, and computer network resources.

With virtualization, you can create multiple virtual machines (VMs) running different operating systems on a single physical machine. Each VM has its own virtual hardware, including CPUs, memory, hard drives, network interfaces, and other devices. This allows you to run multiple operating systems simultaneously on a single physical machine.

It's also a great way to have a clean environment, where you can test your applications without having to worry about messing up your host system.

## Virtualization Software

There are many different virtualization software available, but we will focus on the following:

- [VirtualBox](1_virtualbox.md)
- [Proxmox](2_proxmox.md)
- [Docker](3_docker.md)
- [Kubernetes](4_kubernetes.md) (advanced)

## Proceed

You should fist start with a basic VM software like VirtualBox. With this you can create a VM on your PC.

After that you can proceed with Proxmox, which is a more advanced VM software. It allows you to create VMs on a server and manage them via a web interface. Therefor you need a extra hardware for the server, because Proxmox overwrites the whole hard drive.

Docker uses a different approach for virtualization. It uses containers instead of VMs. This allows you to run multiple applications on a single host system. This is a more advanced topic, but is more and more used in the industry.

Kubernetes is the big brother of docker. It is really complex. For this reason, its not necessary to learn it, but it is a good to know.

## Prior Knowledge

Please read the [prior knowledge](prior_knowledge/index.md) before you start with the virtualization.

## Self Check

!!! goal "Self Check"

    Before you go on, make sure you have completed the following tasks:

    - [X] VirtualBox
        - [X] Install VirtualBox
        - [X] Create a VM
        - [X] Install an OS on the VM (e.g. Ubuntu)
    - [X] Proxmox
        - [X] Install Proxmox on a ThinClient
        - [X] Create a VM
        - [X] Install an OS on the VM (e.g. Ubuntu)
    - [X] Docker
        - [X] Install Docker
        - [X] Run a container (e.g. an NgniX web server)
