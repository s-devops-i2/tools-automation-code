variable "tools_details" {
  default = {
    prometheus = {
      instance_type         = "t3.small"
      policy_resource_list  = ["ec2:DescribeInstances"]
    }
    Grafana = {
      instance_type         = "t3.small"
      policy_resource_list  = []

    }
    vault = {
      instance_type         = "t3.small"
      policy_resource_list  = []

    }
  }
}
variable "zone_id" {}
