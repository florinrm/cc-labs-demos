variable "LabCCTerraform" {
  description = "primul lab in terraform"
  default     = "valoare default a primului lab in terraform"
}

variable "mylist" {
  default = ["ana", "are", "mere"]
}

output "getelement" {
  value = element(var.mylist, 1)
}

output "useindex" {
  value = var.mylist[1]
}

variable "nestedlist" {
  type = list(any)
  default = [
    ["item1", "item2"],
    ["item3", "item4"]
  ]
}

output "nestedlist" {
  value = var.nestedlist[1][1]
}

variable "mymap" {
  default = {
    us   = "United States"
    eu   = "Europe"
    apac = "Asia/Pacific"
  }
}
output "my_region_map" {
  value = var.mymap
}

output "oneMapElement" {
  value = lookup(var.mymap, "us")
}