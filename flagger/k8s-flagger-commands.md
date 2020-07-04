
# installing flagger
```bash
kubectl apply -k github.com/weaveworks/flagger/kustomize/istio
```

```bash
find . -iname k8s-ns.yaml| xargs kubectl apply -f
kubectl label namespace flagger istio-injection=enabled
kubectl config set-context --current --namespace=flagger
# kubectl apply -f . --recursive
```

# Main DB
```bash
find . -iname db-configmap.yaml | xargs kubectl apply -f
find . -iname db-secrets.yaml | xargs kubectl apply -f
find . -iname db-deploy.yaml | xargs kubectl apply -f
find . -iname db-svc.yaml | xargs kubectl apply -f
```

## version DB
```bash
find . -iname version-db-configmap.yaml | xargs kubectl apply -f
find . -iname version-db-deploy.yaml | xargs kubectl apply -f
find . -iname version-db-svc.yaml | xargs kubectl apply -f
```

## Version Application
```bash
find . -iname version-setup-v1.yaml | xargs kubectl apply -f
find . -iname version-setup-v2.yaml | xargs kubectl apply -f
find . -iname version-setup-v3.yaml | xargs kubectl apply -f
find . -iname version-svc.yaml | xargs kubectl apply -f
find . -iname version-configmap.yaml | xargs kubectl apply -f
find . -iname version-secret.yaml | xargs kubectl apply -f
```


## EMP app
```bash
find . -iname emp-configmap.yaml | xargs kubectl apply -f
find . -iname emp-secrets.yaml | xargs kubectl apply -f
find . -iname emp-gateway.yaml | xargs kubectl apply -f
find . -iname emp-deployment-v1.yaml | xargs kubectl apply -f
find . -iname emp-hpa.yaml | xargs kubectl apply -f
```
# apply new release to test canary
```bash
find . -iname emp-flagger-alerting.yaml | xargs kubectl apply -f
find . -iname slack-alerting.yaml | xargs kubectl apply -f
find . -iname emp-deployment-v2.yaml | xargs kubectl apply -f
```

# enable automatic rollback
```bash
find . -iname emp-flagger-error.yaml | xargs kubectl apply -f
find . -iname slack-alerting.yaml | xargs kubectl apply -f
find . -iname emp-k8s-setup-v3.yaml | xargs kubectl apply -f
siege -c 10 -t 15m http://34.76.230.122/api/health
while true; do curl -s http://34.76.230.122/api/health |grep -i version && sleep 1 ; done
while true; do curl -s http://34.76.230.122/api/version |grep -i version && sleep 1 ; done
```

# helm-granfa-flagger
```bash
helm upgrade -i flagger-grafana flagger/grafana --namespace=istio-system --set url=http://prometheus:9090
```