variable "tools_details" {
  default = {
    prometheus = {
      instance_type         = "t3.small"
      policy_resource_list  = ["ec2:DescribeInstances"]
    }
  }
}
variable "zone_id" {}
