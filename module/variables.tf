variable "instance_type" {}
variable "name" {}
variable "zone_id" {}
variable "policy_resource_list" {}
variable "dummy_policy" {
  default = ["ec2:DescribeInstanceTypes"]
}