module "tools" {
  for_each = var.tools_details
  source   = "./module"

  instance_type = each.value["instance_type"]
  name          = each.key
}


