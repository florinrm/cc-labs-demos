# Lab 4 - Terraform
- initializing infrastructure
```bash
terraform init # init the infra

terraform fmt # formatting main.tf file

terraform validate # validate configuration from main.tf file

terraform plan

terraform apply # apply the changes from main.tf

terraform show

docker container ls # check for the freshly created Docker container

terraform destroy
```

- adding variables (`outputs.tf` file):
```bash
terraform apply

terraform show

export TF_VAR_MYTESTVAR="myvalue"

terraform plan

terraform apply

terraform show

export TF_VAR_LabCCTerraform="Value from environment"

terraform apply -var LabCCTerraform=valueFromCommandLine
```