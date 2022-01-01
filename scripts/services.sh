#!/bin/bash

echo "Installing databases..."
bash ./scripts/services/mongodb.sh
bash ./scripts/services/mariadb.sh
