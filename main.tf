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

module "ubuntu-runner" {
  source = "gitlab.com/Javik/terraform-hcloud-modules/vserver"
  version = "1.0.0"
}
