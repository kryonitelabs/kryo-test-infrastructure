#!/bin/bash

# Variable initialization
IS_WSL="$(grep WSL /proc/version &>/dev/null && echo true || echo false)"

echo "Checking prerequisites..."

mkdir -p temp

# Checking if kind is installed
if ! command -v kind &>/dev/null; then
  echo "kind isn't installed yet. Installing it now..."
  curl -LsS -o ./temp/kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64 >/dev/null
  chmod +x ./temp/kind
  sudo mv ./temp/kind /usr/local/bin
fi

# Checking if this script is running in WSL. Checking and installing kubectl if it is not running in WSL.
if ! $IS_WSL; then
  if ! command -v kubectl &>/dev/null; then
    echo "kubectl isn't installed yet. Installing it now..."
    curl -LsS -o ./temp/kubectl "https://dl.k8s.io/release/$(curl -LsS https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" >/dev/null
    sudo install -o root -g root -m 0755 /temp/kubectl /usr/local/bin/kubectl
  fi
fi

# Checking if helm is installed
if ! command -v helm &>/dev/null; then
  echo "helm isn't installed yet. Installing it now..."
  curl -LsS -o ./temp/get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 >/dev/null
  chmod 700 ./temp/get_helm.sh
  ./temp/get_helm.sh
fi

# Checking if skaffold is installed
if ! command -v skaffold &>/dev/null; then
  echo "skaffold isn't installed yet. Installing it now..."
  curl -LsS -o ./temp/skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64 >/dev/null
  sudo install ./temp/skaffold /usr/local/bin/
fi

rm -rf temp

# Checking if Docker is running
if ! docker info >/dev/null 2>&1; then
  echo "This test infrastructure uses Docker, and it isn't running - please start Docker and try again!"
  exit 1
fi
