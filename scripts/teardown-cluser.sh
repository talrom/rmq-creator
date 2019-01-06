#!/usr/bin/env bash

kubectl delete -f k8s-resources/rmq.yaml -n rmq
kubectl delete -f k8s-resources/etcd.yaml -n rmq
kubectl delete svc -n rmq rabbitmq-ui
kubectl delete ns rmq
