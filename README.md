# Inception_101

* [Intro](https://github.com/Abdeljalil-Bouchfar/Inception_101#Intro)
* [What is Docker and How it works?](https://github.com/Abdeljalil-Bouchfar/Inception_101#what-is-docker-and-how-it-works)
* [Docker network](https://github.com/Abdeljalil-Bouchfar/Inception_101#Docker-network)
* [Docker volume](https://github.com/Abdeljalil-Bouchfar/Inception_101#docker-volume)
* [What is Docker-compose and How it works?](https://github.com/Abdeljalil-Bouchfar/Inception_101#what-is-docker-compose-and-how-it-works)
* [The difference between a Docker image used with docker compose and without docker-compose?](https://github.com/Abdeljalil-Bouchfar/Inception_101#the-difference-between-a-docker-image-used-with-docker-compose-and-without-docker-compose)
* [What is the benefit of Docker compared to VMs?](https://github.com/Abdeljalil-Bouchfar/Inception_101#what-is-the-benefit-of-docker-compared-to-vms)

## Intro

In the bad old days, businesses had to purchase a brand-new server every time they wanted a new application. Then VMs came along and revolutionized IT by allowing departments to get more value out of both new and existing IT assets. Despite its success, the VM model isn't perfect.

Following VMware's success, a newer, more efficient, and lightweight virtualization technology called $\color{red}{containers}$ emerged. Initially, containers were challenging to implement and only utilized by web giants with Linux kernel engineers on staff. Docker Inc. changed all of that by democratizing container virtualization technologies, making them accessible to the masses.

Containerization is a technology that allows software to run reliably and consistently across different computing environments, such as development, testing, and production. It involves packaging an application and its dependencies into a self-contained unit called a container, which can run on any host that supports containerization.

The main problem that containerization solves is the "works on my machine" problem. This refers to the common issue where a software application works on one developer's computer but fails to run on another developer's computer or in a different environment.

## What is Docker and How it works?

Docker is a containerization platform that allows developers to package, distribute, and run applications in a containerized environment. It provides an ecosystem of tools and services that enable developers to build and deploy applications quickly and efficiently.

- Common Docker terms:
    - **`Image`:** A Docker image is a read-only template that contains a set of instructions for creating a container that can run on the Docker platform. you can think of an image as a class.
    - **`Container`**: A container is a runnable instance of an image. It's an isolated environment that contains everything needed to run the application, including the code, libraries, dependencies, and configuration.
    - **`Dockerfile`:** A Dockerfile is a text file that contains instructions for building a Docker image. It specifies the base image, the application code, and the runtime environment, among other things.
- Common Dockerfile instructions:
    - `FROM`: specifies the base image to build the new image from.
    - `RUN`: executes a command in the container during build time.
    - `COPY`: copies files or directories from the build context or host to the container.
    - `ADD`: copies files or directories from the build context or host to the container. It also supports URLs and can extract archives.
    - `WORKDIR`: sets the working directory for any RUN, CMD, ENTRYPOINT, COPY, and ADD instructions that follows.
    - `EXPOSE`: specifies which port(s) the container will listen on at runtime.
    - `CMD`: specifies the default command to run when the container starts.
    - `ENTRYPOINT`: specifies the command to run when the container starts. It can also be used as the default command.
    - `ENV`: sets environment variables in the container.
    - `ARG`: defines a build-time variable.
    - `VOLUME`: creates a mount point for external volumes.
- Common Docker commands:
    - **`docker run`**: Creates a new container from a specified image and starts it.
    - **`docker build`**: Builds a new Docker image from a Dockerfile.
    - **`docker pull`**: Pulls an image from a Docker registry, such as Docker Hub.
    - **`docker push`**: Pushes an image to a Docker registry.
    - **`docker images`**: Lists all the Docker images that are currently on your system.
    - **`docker ps`**: Lists all the running Docker containers on your system.
    - **`docker stop`**: Stops a running container.
    - **`docker start`**: Starts a stopped container.
    - **`docker rm`**: Removes a stopped container from your system.
    - **`docker rmi`**: Rremoves an image from your system.

$\color{green}{Docker}$ $\color{green}{works}$ $\color{green}{by}$  leveraging a few core components of the Linux operating system: namespaces, cgroups, and the union file system.

When a Docker container is started, a new namespace is created for the container process. This namespace is isolated from the host operating system and other containers, and it includes its own process table, network interfaces, and file system. The container process is started in this namespace, and it is restricted to only the resources that have been allocated to the container.

Cgroups are used to limit the amount of resources that a container can use, such as CPU, memory, and disk I/O. This allows multiple containers to run on the same physical host without interfering with each other.

Finally, Docker uses a union file system to create a layered file system for the container. The file system of the container is built on top of a base image, and additional layers can be added to the file system as needed. This allows containers to share the same base image, but still have their own unique file system.

[📷 you need to learn Docker RIGHT NOW!! // Docker Containers 101](https://youtu.be/eGz9DS-aIeY)

[📝 What Are Namespaces and cgroups, and How Do They Work?](https://www.nginx.com/blog/what-are-namespaces-cgroups-how-do-they-work/)

[📷 Cgroups, namespaces, and beyond: what are containers made from?](https://youtu.be/sK5i-N34im8)

[📝 UnionFS : A File System of a Container](https://medium.com/@knoldus/unionfs-a-file-system-of-a-container-2136cd11a779)

[📷 Containers from scratch: The sequel - Liz Rice (Aqua Security)](https://youtu.be/_TsSmSu57Zo)

## Docker network

In Docker, a network is a virtual network interface that connects containers and allows them to communicate with each other. By default, Docker creates a bridge network for each Docker installation, which is a private network that allows containers to communicate with each other but not with the host machine or other networks outside the Docker environment.

Docker networks can be created and managed using the **`docker network`** command. This command allows users to create custom networks with specific configurations, such as a custom IP range or a network with no internet access.

When a container is started, it can be attached to one or more networks using the **`--network`** option. This allows the container to communicate with other containers on the same network. Each container can have its own network settings, including IP address and port forwarding.

Docker also provides a number of network drivers that allow for more advanced networking capabilities, such as overlay networks for multi-host networking, and macvlan networks for giving containers their own unique MAC addresses on the host network.

- common Docker network commands:
    - **`docker network create`**: Creates a new Docker network
    - **`docker network ls`**: Lists all available Docker networks
    - **`docker network inspect`**: Displays detailed information about a specific Docker network
    - **`docker network connect`**: Connects a container to a specified Docker network
    - **`docker network disconnect`**: Disconnects a container from a specified Docker network
    - **`docker network rm`**: Removes a specified Docker network
    - **`docker network prune`**: Removes all unused Docker networks.

[📷 Docker networking is CRAZY!! (you NEED to learn it)](https://youtu.be/bKFMS5C4CG0)

## Docker volume

In Docker, a volume is a way to persist data that is stored inside a container even after the container is deleted or restarted. A Docker volume is essentially a directory that is stored on the host machine and mounted into a container.

Volumes can be used for a variety of purposes, such as storing database data or log files that need to persist even if the container is removed. Additionally, volumes can be used to share data between containers, allowing multiple containers to access the same data at the same time.

Docker provides several options for creating and managing volumes. Volumes can be created manually using the **`docker volume create`** command, or they can be created automatically when a container is launched by specifying the volume in the **`docker run`** command. Volumes can also be managed using the Docker CLI or a graphical user interface.

Docker volumes are often preferred over bind mounts, which mount a host file or directory into a container, because volumes provide better data management, better performance, and greater portability across different host systems.

[📝 Understanding Docker Volumes with an example](https://medium.com/bb-tutorials-and-thoughts/understanding-docker-volumes-with-an-example-d898cb5e40d7)

## What is Docker-compose and How it works?

Docker-compose is a tool for defining and running multi-container Docker applications, it works by reading a configuration file, usually called **`docker-compose.yml`**, which describes the containers that make up your application and how they should be run. The configuration file is written in YAML format and is composed of several sections, including:

- `Services`: A list of services that make up your application, along with their configurations, such as the Docker image to use, the command to run, and any environment variables.
- `Networks`: A list of custom Docker networks to be created, along with their configurations.
- `Volumes`: A list of volumes to be created and mounted into the containers.

When you run **`docker-compose up`**, Docker Compose reads the **`docker-compose.yml`** file and creates the necessary containers, networks, and volumes to run your application. It then starts the containers in the correct order, based on any dependencies between them, and sets up the necessary networking between the containers. Docker Compose also monitors the containers and automatically restarts them if they fail.

- Common Docker-compose commands:
    - **`docker-compose up`**: Start all the containers defined in the **`docker-compose.yml`** file.
    - **`docker-compose down`**: Stop and remove all the containers defined in the **`docker-compose.yml`** file.
    - **`docker-compose build`**: Build the images for the services defined in the **`docker-compose.yml`** file.
    - **`docker-compose start`**: Start all the containers that have been created using the **`docker-compose up`** command.
    - **`docker-compose stop`**: Used to stop all the containers that have been created using the **`docker-compose up`** command.
    - **`docker-compose ps`**: Show all the running containers.
    - **`docker-compose logs`**: Display the logs of all the containers defined in the **`docker-compose.yml`** file.
    - **`docker-compose exec`**: Execute a command inside a running container.
    - **`docker-compose run`**: Start a new container and run a command inside it.
    - **`docker-compose config`**: Validate and view the **`docker-compose.yml`** file.

[📷 Docker Compose will BLOW your MIND!! (a tutorial)](https://youtu.be/DM65_JyGxCo)

## The difference between a Docker image used with docker compose and without docker-compose?

The main difference between using a Docker image with or without Docker-compose is the ease of managing multi-container applications. Docker-compose provides a simpler and more efficient way to manage multi-container applications, eliminating the need for manual management of multiple containers.

## What is the benefit of Docker compared to VMs?

The main benefit of Docker compared to VMs is that Docker containers are much lighter weight and more efficient. They share the host OS kernel, so they can be started and stopped much faster than a VM, and they use fewer resources.

Some of the main differences between Docker and VMs:

|  | Docker | Virtual Machines (VMs) |
| --- | --- | --- |
| Size | Very small in size | Large in size |
| Performance | Faster, since it runs on the host OS | Slower, since it requires its own OS |
| Resource usage | Lightweight, uses fewer resources than VMs | Heavyweight, uses more resources than Docker |
| Portability | Highly portable, can run on any machine | Less portable, may require additional setup |
| Isolation | Uses containerization to provide isolation | Uses hardware virtualization to provide isolation |
| Boot time | Almost instant | Longer boot time |
| Configuration | Uses Dockerfiles for configuring and deploying | Uses complex virtual hardware configuration |
| Maintenance | Easier to maintain due to smaller size and simpler architecture | More complex maintenance due to larger size and more complex architecture |
| Use cases | Ideal for microservices, cloud-native applications, and deployment automation | Ideal for running multiple operating systems and applications on a single physical server |
