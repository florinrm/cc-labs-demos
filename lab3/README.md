# Lab 3 - Kubernetes deployments and services
## Deployments
- create a new deployment:
```bash
kubectl apply -f lab3dep.yaml
```

- let's see the deployments, the ReplicaSets and the pods:
```bash
kubectl get pods

kubectl get rs

kubectl get deploy
```

- let's launch an updated deployment and then let's see the ReplicaSets and the pods:
```bash
kubectl apply -f mynewdep.yaml

kubectl get pods # new pods from a new ReplicaSet are created and then the old pods are killed

kubectl get rs # a new ReplicaSet is created - the old RS will have zero pods after the old pods are deleted (that's logical, right?)
# and it still exists as may go back to the previous deployment
```

### Example
```bash
kubectl scale deployment cc-dep-01 --replicas=2 # updating the number of replicas from deployment

kubectl get pods

kubectl get rs

kubectl scale deployment cc-dep-01 --replicas=5

kubectl get pods

kubectl get rs
```

- let's update the deployment with a wrong image, thus the deployment should fail:
```bash
kubectl set image deployment cc-dep-01 nginx=nginx:failTest
```

- we'll see the pods failed to be created due to invalid image:
```bash
kubectl get pods
```

- let's see the history of the current deployment
```bash
kubectl rollout history deployment cc-dep-01
```

- let's compare the current version with a previous version:
```bash
kubectl rollout history deployment cc-dep-01 --revision=2
```

- let's roll back and check the pods:
```bash
kubectl rollout undo deployment cc-dep-01

kubectl get pods
```

## Services and volumes
- let's create the ConfigMap for PostgreSQL DB:
```bash
kubectl apply -f db-config-map.yaml
```

- create the Persistent Volume and Persistent Volume Claim for DB:
```bash
kubectl apply -f db-persistent-volume.yaml -f db-persistent-volume-claim.yaml

kubectl get pv
kubectl get pvc
```

- create the DB pod:
```bash
kubectl apply -f db-pod-config.yaml
```

- let's expose the DB port using ClusterIP service:
```bash
kubectl apply -f db-cluster-ip-config.yaml
```

- let's create API pod and expose it:
```bash
kubectl apply -f api-pod-config.yaml

kubectl expose pod apipod --port 80 --type=NodePort # we will see the port used by the service, for example 80:30714/TCP
# OR
kubectl apply -f api-nodeport-config.yaml
```

- let's configure the DB in the K8S pod:
```bash
kubectl exec -it db-pod bash # entering in the DB pod

psql -h localhost -U admin --password books # connecting to the DB instance

```

- and we will run this SQL query:
```sql
CREATE TABLE IF NOT EXISTS books (
    id uuid PRIMARY KEY NOT NULL ,
    title VARCHAR NOT NULL,
    author VARCHAR NOT NULL
);
```