# Project11 Bridge

This package offers a way to use [CCOM JHC's](https://github.com/CCOMJHC) ROS1-bassed Project11 backseat driver framework on ROS2 platforms. &#x20;

### Motivation

Project11 targets Ubuntu 20.04 and ROS Noetic, the latest LTS of ROS1.   However, the first LTS release of ROS2 targets Ubuntu 22.04.   The goal of this project was to develop a portable way to support Project11 on ROS2 Platforms running Ubuntu 22.04 and later.   Additionally,  Project11 Bridge offers a way to incrementally update components of Project11 suite from ROS1 to ROS2.

### How it works

Project11 Bridge utilizes several technologies to maintain portability across Ubuntu versions and compatibility with ROS2.

* **Docker** is used to create a virtual environment which contains installations of **ROS1** and **ROS2.**
* **ROS1\_bridge** is used to translate all or select ROS1 messages to a ROS2 vehicle and vice versa

## Installation

### Step1: Install Docker

* Follow the instructions here to install docker for Ubuntu:  [https://docs.docker.com/engine/install/ubuntu/](https://docs.docker.com/engine/install/ubuntu/)
* It is higly recomended that you complete the post install steps to configure your user with docker permissions:  [https://docs.docker.com/engine/install/linux-postinstall/](https://docs.docker.com/engine/install/linux-postinstall/)

