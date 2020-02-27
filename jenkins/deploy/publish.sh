#!/bin/bash

export REGISTRY="localhost:5043"
export IMAGE=$(awk 'NR==1 {print; exit}' /tmp/.auth)
export TAG=$(awk 'NR==2 {print; exit}' /tmp/.auth)

cd ~/jenkins/ && docker-compose up -d
