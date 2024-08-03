######################################
#           _             _ _        #
#          | |           (_) |       #
#          | | __ ___   ___| | __    #
#      _   | |/ _` \ \ / / | |/ /    #
#     | |__| | (_| |\ V /| |   <     #
#      \____/ \__,_| \_/ |_|_|\_\    #
#                                    #
######################################

# Filename: alma-runner.tf
# Description: 
# Version: 1.0.0
# Author: Benjamin Schneider <ich@benjamin-schneider.com>
# Date: 2024-07-28
# Last Modified: 2024-07-28
# Changelog: 
# 1.0.0 - Initial version

module "alma9-runner" {
  source        = "gitlab.com/Javik/terraform-hcloud-modules/vserver"
  version       = "~> 1.0.0"
  name_prefix   = "alma-9"
  service_count = 1
  cloud_init    = "./.terraform/modules/ubuntu-22_04-runner/cloud-init/cloud-init"

  domain      = module.globals.domain
  environment = module.globals.environment
  image       = "alma-9"
  keep_disk   = true
  add_index   = false

  network_id = module.network.network.id
  subnet     = "10.0.30.0/24"

  ssh_key_ids      = module.globals.ssh_key_ids
  cloudflare_zones = module.globals.cloudflare_zones

  labels = {
    "managed_by" = "terraform",
    "type"       = "runner",
    "os"         = "alma",
    "version"    = "9"
  }

  firewall_rules = [
    {
      direction   = "in"
      protocol    = "icmp"
      description = "ICMP"
      source_ips = [
        "0.0.0.0/0",
        "::/0"
      ]
    },
    {
      direction   = "in"
      protocol    = "tcp"
      port        = "22"
      description = "SSH"
      source_ips = [
        "0.0.0.0/0",
        "::/0"
      ]
    },
    {
      direction   = "in"
      protocol    = "tcp"
      port        = "80"
      description = "HTTP"
      source_ips = [
        "0.0.0.0/0",
        "::/0"
      ]
    },
    {
      direction   = "in"
      protocol    = "tcp"
      port        = "443"
      description = "HTTPS"
      source_ips = [
        "0.0.0.0/0",
        "::/0"
      ]
    },
    {
      direction   = "in"
      protocol    = "udp"
      port        = "60000-61000"
      description = "Mosh"
      source_ips = [
        "0.0.0.0/0",
        "::/0"
      ]
    }
  ]

  depends_on = [
    module.globals,
    module.network,
  ]
}
