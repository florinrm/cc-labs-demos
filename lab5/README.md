# Lab 5 - Terraform + AWS
## Deploying EC2 VMs
- check `ec2/` folder firstly:
```bash
terraform init
terraform fmt
terraform plan
terraform apply
```
- let's update the `Name` field from `tags` field and run the commands above again

## Deploying EKS
- check `k8s/` folder firstly:
```bash
terraform init
terraform fmt
terraform plan
terraform apply
```
- let's wait until the K8S cluster is created in K8S, then we can run:
```bash
aws eks --region $(terraform output -raw region) update-kubeconfig \
    --name $(terraform output -raw cluster_name)

kubectl cluster-info
```