#!/usr/bin/env bash

RMQ1=$(kubectl.exe get pods -n rmq | grep "rabbit" | awk 'NR==1{print $1}')

kubectl.exe exec $RMQ1 -n rmq rabbitmqctl add_user <user> <password>
sleep 5

kubectl.exe exec $RMQ1 -n rmq rabbitmqctl set_user_tags admin administrator
sleep 5

kubectl.exe exec $RMQ1 -n rmq -- rabbitmqctl set_permissions admin ".*" ".*" ".*"
sleep 5

# expose rabbitMQ mgmt UI
kubectl.exe exec $RMQ1 -n rmq -- rabbitmq-plugins enable rabbitmq_management
sleep 5
kubectl --namespace=rmq expose deployment rabbitmq-deployment --port 15672 --type=LoadBalancer --name=rabbitmq-ui
