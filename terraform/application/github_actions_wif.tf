module "github-actions-wif" {
  source = "./vendor/modules/azure//azure/github_actions_wif"

  resource_group_name    = var.resource_group_name
  subscription_short     = var.subscription_short
  env_short              = var.env_short
  service_short          = var.service_short
  config_short           = var.config_short
  environment            = var.environment
  ga_wif_managed_id      = var.ga_wif_managed_id
  ga_wif_immutable_repos = var.ga_wif_immutable_repos
}
