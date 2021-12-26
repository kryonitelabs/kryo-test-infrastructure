#!/bin/bash

if docker ps -a | grep -q 'test-infra-control-plane'; then
  echo "Cluster already exists! Starting it..."
  docker start test-infra-control-plane >/dev/null 2>&1
else
  echo "Preparing cluster..."
  kind create cluster --config configs/kind.yaml
fi
