provider "google" {
  project     = var.gcp_project_id
  credentials = var.gcp_credentials
  region      = var.gcp_region
  zone        = var.gcp_zone
}

module "service-account" {
  source = "../"

  name        = "test"
  environment = var.environment
  label_order = var.label_order

  service_account_enabled     = true
  account_id                  = "clouddrove"
  project                     = "clouddrove"
  service_account_key_enabled = true
  service_account_id          = module.service-account.name
  key_algorithm               = "KEY_ALG_RSA_2048"
  public_key_type             = "TYPE_X509_PEM_FILE"
  private_key_type            = "TYPE_GOOGLE_CREDENTIALS_FILE"
  service_account_ids         = module.service-account.name
}