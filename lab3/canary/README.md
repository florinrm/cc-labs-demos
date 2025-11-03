# Commands
```shell
kubectl apply -f stable-app.yaml

kubectl get pods -l track=stable

kubectl port-forward svc/web-app-service 8888:80

for i in {1..10}; do 
  curl -s 127.0.0.1:8888 | grep Version; 
done

kubectl apply -f canary-app.yaml

kubectl get pods -l app=web-app

for i in {1..20}; do 
  curl -s 127.0.0.1:8888 | grep Version; 
done

kubectl scale deployment/stable-app --replicas=5
kubectl scale deployment/canary-app --replicas=5

kubectl get pods -l app=web-app

for i in {1..20}; do 
  curl -s 127.0.0.1:8888 | grep Version; 
done

kubectl scale deployment/stable-app --replicas=0
kubectl scale deployment/canary-app --replicas=10

kubectl delete deployment canary-app

kubectl scale deployment/canary-app --replicas=0

kubectl delete deployment stable-app canary-app
kubectl delete service web-app-service
kubectl delete configmap web-app-v1 web-app-v2
```