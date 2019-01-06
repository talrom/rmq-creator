#!/usr/bin/env bash
##
# Script to deploy 3 nodes Rabbitmq auto cluster on k8s (locally)
##

kubectl create namespace rmq

kubectl create -f k8s-resources/etcd.yaml -n rmq
sleep 5

kubectl create -f k8s-resources/rmq.yaml -n rmq
sleep 5

#kubectl expose deployment rabbitmq-deployment --port 5672  --type=LoadBalancer  --namespace=rmq




