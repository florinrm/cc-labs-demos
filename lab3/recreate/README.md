# Commands
```shell
kubectl apply -f app-v1.yaml

kubectl get pods -l app=recreate-app

kubectl port-forward svc/recreate-app-service 8888:80

curl 127.0.0.1:8888 # terminal

kubectl get pods -l app=recreate-app -w

kubectl apply -f app-v2.yaml
```