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
    elk = {
      instance_type         = "r7i.large"
      policy_resource_list  = []

    }
    CI = {
      instance_type         = "t3.small"
      policy_resource_list  = []

    }
    SonarQube = {
      instance_type         = "t3.large"
      policy_resource_list  = []

    }

  }
}
variable "zone_id" {}
