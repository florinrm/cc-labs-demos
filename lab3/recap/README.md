# Commands
```shell
kubectl apply -f deployment-v1.yaml

kubectl rollout history deployment/recap-app

kubectl set image deployment/recap-app nginx=nginx:1.23

kubectl rollout status deployment/recap-app
kubectl rollout history deployment/recap-app

kubectl rollout undo deployment/recap-app

kubectl delete deployment recap-app
kubectl delete service recap-app-service
```