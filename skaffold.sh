#!/bin/bash

if docker ps | grep -q 'test-infra-control-plane'; then
  skaffold dev -f configs/skaffold.yaml --cache-artifacts=false
else
  echo "Test infrastructure is not running. Use ./start.sh first!"
fi
