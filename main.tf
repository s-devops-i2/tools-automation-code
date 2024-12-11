module "tools" {
  for_each = var.tools_details
  source   = "./module"

  instance_type = each.value["instance_type"]
  name          = each.key
  zone_id       = var.zone_id
  policy_resource_list = each.value["policy_resource_list"]
}


