# Lab 2 - introduction to Kubernetes
## Clusters

- creating clusters:
```bash
kind create cluster --config kind-config.yaml
```

- info about the current cluster:
```bash
kubectl cluster-info [dump]
```

- listing components from current cluster:
```bash
kubectl get all
```

- listing pods from current cluster:
```bash
kubectl get pods
```

- listing cluster nodes:
```bash
kubectl get nodes
```

- displaying details about a node:
```bash
kubectl describe nodes <node>

kubectl describe nodes kind-control-plane
```

- delete cluster:
```bash
kind delete cluster
```

## Pods
- creating pods (imperative) based on a Docker image - background mode:
```bash
kubectl run my-nginx --image=nginx
kubectl run alpine --image=alpine
```

- creating pods (imperative) based on a Docker image - interactive mode:
```bash
kubectl run -i --tty --rm alpine --image=alpine
```

- creating namespaces, in which pods can run:
```bash
kubectl create namespace <namespace-name>
```

- run a pod in a namespace:
```bash
kubectl run alpine --image=alpine -n <namespace-name>
```

- get pods from a namespace:
```bash
kubectl get pods -n <namespace>
```

- execute command in a runnig pod:
```bash
kubectl exec -it <podname> <command>
kubectl exec -it mypod ls # (mypod is already running)
```

- delete a pod (from a namespace):
```bash
kubectl delete pod <pod> -n <namespace>
```

### Example 1
```bash
kubectl create namespace my-first-namespace # creating namespace

# creating pods in this namespace
kubectl run my-nginx --image=nginx -n=my-first-namespace

kubectl run alpine --image=alpine -n=my-first-namespace

kubectl exec -it my-nginx -n=my-first-namesp
ace -- ls # executing ls in my-nginx pod

# delete pods
kubectl delete pod alpine -n=my-first-namespace

kubectl delete pod my-nginx -n=my-first-name
space

kubectl delete namespace my-first-namespace # delete namespace
```

- create a pod using a configuration file:
```bash
kubectl apply -f nginxpod.yaml
```

### Example 2
```bash
kubectl apply -f testapp-pod.yaml # creates testapp pod

kubectl port-forward testapp 8888:5000 # port forwarding to testapp pod

kubectl logs testapp # gets logs from testapp pod

kubectl exec testapp -- ls # executes ls command in testapp pod

kubectl cp kind-config.yaml testapp:./kind-config.yaml # copy kind-config.yaml file in testapp pod

kubectl delete pod testapp # deleted testapp pod
```

## Generating YAML files
- generate YAML configurations for pods:
```bash
kubectl run nginx --image=nginx --dry-run=client -o yaml > my-nginx-pod.yaml
```

## Labels and selectors
```bash
# create pod and add app:myapp label
kubectl run nginx --image=nginx --dry-run=client -o yaml > my-nginx-pod.yaml

# see pod details
kubectl describe pod nginx

# get pods using label selector
kubectl get pods -l app=myapp
```

## ReplicaSets

## Deployments

## ConfigMaps and Secrets