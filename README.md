# citybuild-test-infrastructure

## Usage

### Start cluster
The start bash script automatically installs needed prerequisites and starts the development cluster.
```bash
./start.sh
```

### Stop / delete cluster
The stop bash script kills cluster and deletes its state.
```bash
./stop.sh
```

### Access cluster with [Lens](https://k8slens.dev/)
**kind** automatically saves a kubeconfig file to the following directory "/root/.kube/config".
Just add a directory watcher to this directory and [Lens](https://k8slens.dev/) automatically detects changes.

### Exposed services
| Service       | Port  |
|---------------|-------|
| mongodb       | 30001 |
