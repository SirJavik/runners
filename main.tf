######################################
#           _             _ _        #
#          | |           (_) |       #
#          | | __ ___   ___| | __    #
#      _   | |/ _` \ \ / / | |/ /    #
#     | |__| | (_| |\ V /| |   <     #
#      \____/ \__,_| \_/ |_|_|\_\    #
#                                    #
######################################

# Filename: main.tf
# Description: 
# Version: 1.0.0
# Author: Benjamin Schneider <ich@benjamin-schneider.com>
# Date: 2024-07-28
# Last Modified: 2024-07-28
# Changelog: 
# 1.0.0 - Initial version

#########################
# Modules Configuration #
#########################

module "globals" {
  source      = "gitlab.com/Javik/terraform-javikweb-modules/globals"
  version     = "~> 1.0.0"
  environment = "live"
  domain      = "runners.sirjavik.de"
}

module "network" {
  source      = "gitlab.com/Javik/terraform-hcloud-modules/network"
  version     = "~> 1.0.0"
  environment = module.globals.environment
}
