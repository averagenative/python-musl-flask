# python-musl-flask
Python flask and musl based


### Example push/build commands

```bash
podman build -t ghcr.io/averagenative/python-musl-flask:latest .
podman push ghcr.io/averagenative/python-musl-flask:latest
```

### Example gh clone and deploy
```bash
gh repo clone averagenative/python-musl-flask
cd python-musl-flask
kubectl apply -f python-flask-deployment.yaml
```

### Example usage for default namespaced deployment
```bash
kubectl exec -it -n deploy/python-flask-musl -- bash
```

### Example run command
```bash
kubectl run pyflask --image=ghcr.io/averagenative/python-musl-flask:latest -it --rm --restart=Never -- bash
```

### Example deploy without cloning
```bash
kubectl apply -f https://raw.githubusercontent.com/averagenative/python-musl-flask/refs/heads/main/python-flask-deployment.yaml
```
