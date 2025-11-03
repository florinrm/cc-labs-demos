# Lab 4 - Helm

## Creating K8S cluster with Kind

```shell
# creating a new cluster, serving in a Docker container, which acts as a node
kind create cluster --name cloud-lab4

# see info about a cluster
kubectl cluster-info --context kind-cloud-lab4

# see the current context
kubectl config current-context

kind delete cluster --name cloud-lab4
```

## Helm charts

```shell
# creating a Helm chart
helm create mychart

# release Helm chart
helm install example-release ./mychart

# checking the pods created using Helm charts
kubectl get pods,rs,svc 

helm template example-release ./mychart --set replicaCount=2

helm upgrade example-release ./mychart --set replicaCount=2

kubectl get deployment example-release-mychart -o yaml | grep replicas

helm rollback example-release

helm uninstall example-release
```

## Helm charts + repos
```shell
helm repo add bitnami https://charts.bitnami.com/bitnami

helm install my-nginx bitnami/nginx

kubectl get pods,rs,svc -l app.kubernetes.io/instance=my-nginx

helm uninstall my-nginx
```

## Helm charts for multi-pods apps
```shell
helm create webapp

helm install webdemo ./webapp

kubectl get pods -l app=webdemo-backend

kubectl get pods -l app=webdemo-frontend

kubectl get svc | grep webdemo

helm template webdemo ./webapp | less

helm get manifest webdemo

helm upgrade webdemo ./webapp --set frontend.replicaCount=2

helm uninstall webdemo
```