#!/bin/bash

helm repo add bitnami https://charts.bitnami.com/bitnami
helm upgrade -i mongodb bitnami/mongodb --version 10.30.6 -f ./configs/mongodb.yaml

while [ "$(kubectl get --ignore-not-found pods mongodb-0 -n default --no-headers -o jsonpath="{.status.phase}")" != "Running" ]; do
  echo "Waiting for MongoDB cluster nodes to be ready..."
  sleep 15
done
