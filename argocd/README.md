# Install Argo 
```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

# Apply argo configuration
```bash
kubectl apply -f argocd-ns.yaml
kubectl apply -f argocd-repo-config.yaml
argocd repo add https://github.com/moazrefat/K8S-Bonus --username <username> --password <password>
```

# Main DB
```bash
find . -iname db-configmap.yaml | xargs kubectl apply -f
find . -iname db-secrets.yaml | xargs kubectl apply -f
find . -iname db-deploy.yaml | xargs kubectl apply -f
find . -iname db-svc.yaml | xargs kubectl apply -f
```
## EMP app
```bash
find . -iname emp-configmap.yaml | xargs kubectl apply -f
find . -iname emp-gateway.yaml | xargs kubectl apply -f
find . -iname emp-k8s-setup-v1.yaml | xargs kubectl apply -f
```

## Version app
```bash
find . -iname version-setup-v1.yaml | xargs kubectl apply -f
find . -iname version-svc.yaml | xargs kubectl apply -f
find . -iname version-vs.yaml | xargs kubectl apply -f
find . -iname version-svc.yaml | xargs kubectl apply -f
find . -iname version-configmap.yaml | xargs kubectl apply -f
find . -iname version-secret.yaml | xargs kubectl apply -f
```

## version DB
```bash
find . -iname version-db-configmap.yaml | xargs kubectl apply -f
find . -iname version-db-deploy.yaml | xargs kubectl apply -f
find . -iname version-db-svc.yaml | xargs kubectl apply -f
```

# get argo installed apps 
```bash
argocd app list
argocd app get employees
```