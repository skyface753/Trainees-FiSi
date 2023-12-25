# Intro with VirtualBox

## Background

### What is virtualization?

Virtualization is a technique to run multiple operating systems on one computer.

### Why virtualization?

Virtualization is used to separate different applications from each other. This is useful if you want to run multiple applications on one computer, but you don't want them to interfere with each other.

### What is a VM?

A VM is a virtual machine. It is a full virtualization of a computer. It has its own operating system and its own resources (e.g. CPU, RAM, ...).

## VirtualBox

[VirtualBox](https://www.virtualbox.org/) is a virtualization software. It gets installed on an operating system and provides a graphical user interface (GUI) to manage the virtual machines (VMs).

!!! note

    VirtualBox is just a software that gets installed on an operating system, so you can use it in parallel to your operating system. (But you must share the resources of your computer between the operating system and VirtualBox.)

## Install

Please follow the [official installation guide](https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#1-overview)

<?quiz?>

question: How much RAM can you give your VM, if you have 8 GB RAM on your computer?
answer: 8 GB
answer-correct: < 8 GB
content:

<h4> Great! </h4>

A VM can only use the resources that are available on the host system. So if you have 8GB RAM on your computer, you can't give 8 GB RAM to your VM.

<?/quiz?>
