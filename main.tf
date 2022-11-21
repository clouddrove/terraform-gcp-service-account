module "labels" {
  source = "git::https://github.com/clouddrove/terraform-gcp-labels.git?ref"

  name        = var.name
  environment = var.environment
  label_order = var.label_order
}

resource "google_service_account" "default" {
  count = var.service_account_enabled && var.module_enabled ? 1 : 0

  account_id   = var.account_id
  display_name = module.labels.id
  description  = var.description
  project      = var.project
}

resource "google_service_account_key" "default" {
  count = var.service_account_key_enabled && var.module_enabled ? 1 : 0

  service_account_id = var.service_account_id
  key_algorithm      = var.key_algorithm
  public_key_type    = var.public_key_type
  private_key_type   = var.private_key_type
  public_key_data    = var.public_key_data
  keepers            = var.keepers
}
