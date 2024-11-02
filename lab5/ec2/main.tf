terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2" # regiunea in care o sa se faca deploy la resurse
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3" # tipul de masina folosita (ami = Amazon Machine Image)
  instance_type = "t2.micro"     # tipul de instanta (resursele pe care le are masina)

  tags = {
    Name = "testUpdate"
  }
}