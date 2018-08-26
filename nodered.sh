#!/bin/bash
docker pull nodered/node-red-docker:rpi-v8
kubectl apply -f nodered-deployment.yml
kubectl expose deployment nodered-deployment --type=NodePort --name=nodered  --port=1880 --external-ip=192.168.81.16