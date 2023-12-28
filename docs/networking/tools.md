---
tags: CLI, Tools
---

# Network Tools

There are many tools that can be used to debug networks. Here are some of them:

- [ping](#ping)
- [traceroute](#traceroute)
- [nmap](#nmap)
- [netcat](#netcat)
- [nslookup](#nslookup)

## ping

`ping` is a tool to check if a host is reachable. It sends ICMP packets to the host and waits for a response. If the host is reachable, it will respond with an ICMP packet. If the host is not reachable, it will not respond.

```bash
ping <host>
```

## traceroute

`traceroute` is a tool to check the route to a host. It prints all the hops between you and the target.

```bash
traceroute <host>
```

## nmap

`nmap` is a tool to scan a host for open ports. It can also be used to scan a whole network for open ports. Its a very powerful tool, which will also be used for hacking.

You can find the download [here](https://nmap.org/download).

```bash
nmap <host> # scan a host
nmap -sS <host> # scan a host with TCP SYN scan
namp -Pn <host> # scan a host without ping
```

## netcat

`netcat` is a tool to send and receive data over TCP and UDP. It can be used to debug network connections.

```bash
nc -l <port> # listen on a port
nc <host> <port> # connect to a host on a port
```

## nslookup

`nslookup` is a tool to query DNS servers. It can be used to debug DNS.

```bash
nslookup <host> # query the DNS server for a host
nslookup <host> <dns-server> # query a specific DNS server for a host
```
