# Commands

```shell
kubectl apply -f blue-deployment.yaml
kubectl apply -f service.yaml

kubectl get pods -l env=blue

kubectl apply -f green-deployment.yaml

kubectl get deployments blue-deployment green-deployment
kubectl get pods -l app=web-app

kubectl port-forward $(kubectl get pod -l env=green -o jsonpath='{.items[0].metadata.name}') 8080:80 

curl http://localhost:8080

kubectl patch service web-app-service -p '{"spec":{"selector":{"app":"web-app","env":"green"}}}'

kubectl patch service web-app-service -p '{"spec":{"selector":{"app":"web-app","env":"blue"}}}'

kubectl delete deployment blue-deployment green-deployment
kubectl delete service web-app-service
kubectl delete configmap blue-config green-config
```