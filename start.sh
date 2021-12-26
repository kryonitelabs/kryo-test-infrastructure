#!/bin/bash

if bash ./scripts/prerequisites.sh; then
  bash ./scripts/cluster.sh
  bash ./scripts/services.sh
fi
