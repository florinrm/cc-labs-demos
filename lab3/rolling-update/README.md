# Commands

```shell
kubectl apply -f app-v1.yaml

kubectl get pods -l app=rolling-app -w # other terminal

kubectl get service rolling-app-service

kubectl port-forward svc/rolling-app-service 8888:80

curl 127.0.0.1:8888 # terminal

kubectl apply -f app-v2.yaml

kubectl get pods

for i in {1..30}; do echo -n "$(date +%H:%M:%S) - "; curl -s 127.0.0.1:8888 | grep Version; sleep 1; done # other terminal

kubectl apply -f app-v2.yaml

kubectl rollout status deployment rolling-app
kubectl rollout history deployment rolling-app

kubectl rollout undo deployment rolling-app

kubectl delete deployment rolling-app
kubectl delete service rolling-app-service
kubectl delete configmap rolling-app-v1 rolling-app-v2
