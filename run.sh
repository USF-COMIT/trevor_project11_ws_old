#!/bin/bash

cd "$(dirname "$0")"
source devel/setup.bash
roslaunch trevor_project11 robot_core.launch operator_ip:=10.1.1.38
