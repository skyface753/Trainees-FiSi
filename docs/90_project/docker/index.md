# Docker Project

In this project, you will create your own Docker Image.

> The goal is to create your own Docker Image without using the pre-built Docker Images for Wordpress.

## Steps

### Run Wordpress on a Raspberry Pi (without Docker)

<https://tutorials-raspberrypi.de/raspberry-pi-wordpress-server-nginx/>

### Run Wordpress on a Raspberry Pi (with Docker)

<https://gridscale.io/community/tutorials/dockerize-wordpress-docker-compose/>

### Create your own Docker Image

Lets reflect what we have learned till now.

- We know, how to install Wordpress on a Raspberry Pi manually.
- We know how we can run a Service with Docker with a Database.

A simple Dockerfile:

```Dockerfile
FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y apache2
CMD ["apache2ctl", "-D", "FOREGROUND"]
```

This Dockerfile starts with a base image of Ubuntu. Similar like you would start with a basic Ubuntu installation.

Then it updates the package list and installs the apache2 package.

Finally, it starts the apache2 service.

Now we just need to reproduce the steps we did manually to install Wordpress on a Raspberry Pi.

### Give a presentation

Prepare a litte presentation about your Docker Image.

The presentation should include the following points:

- What files are needed to build the Docker Image?
- What commands are necessary in the Dockerfile?
- How can the Docker Image be built and run?
- Present your Docker Image
