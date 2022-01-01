#!/bin/bash

kubectl apply -f ./configs/mariadb-deployment.yaml
kubectl apply -f ./configs/mariadb-service.yaml
