# Proxmox

## Install Proxmox

[Proxmox](https://www.proxmox.com/en/) is a virtualization platform based on Debian. It is free and open source. It is a good alternative to VMware ESXi.

### Download Proxmox

Download the latest version of Proxmox from the [Proxmox website](https://www.proxmox.com/en/downloads).

<div class="quiz">
    <h3> Are you ready? </h3>
    <answers>
        <answer correct>Yes!</answer>
        <answer>No!</answer>
    </answers>
    <content> 
        <h4> Great! </h4>
        ```bash
        sudo mn --topo single,3 --mac --switch ovsk --controller remote
        ```
    </content>
</div>

## First VM

Now that we have Proxmox installed, let's create our first VM.

<div class="quiz">
    <h3> Do you create a VM or an LXC? </h3>
    <answers>
        <answer correct>VM!</answer>
        <answer>LXC!</answer>
    </answers>
    <content> 
        <h4> Great! </h4>
        You are right!
        The VM is a full virtualization, while the LXC is a container.
    </content>
</div>

### Create a VM
