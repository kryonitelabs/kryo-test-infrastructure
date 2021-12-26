#!/bin/bash

read -p "Do you want to keep your data? (Y/n) " -n 1 -r
echo
case $REPLY in
  y | Y)
    echo "Stopping cluster..."
    docker stop test-infra-control-plane >/dev/null 2>&1
    ;;
  n | N)
    kind delete cluster --name test-infra
    ;;
  *)
    echo "Option '$REPLY' not available! Exiting..."
    exit 1
    ;;
esac
