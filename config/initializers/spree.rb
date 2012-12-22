# encoding: utf-8
# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  config.site_name = "Мастер Маляр"
  config.currency = "RUB"

   config.use_s3 = true
   config.s3_bucket = 'master_painter_staging'
   config.s3_access_key = "AKIAIPCX4XDWJZG65XUQ"
   config.s3_secret = "K251Uik39bQSv/lSTUDUIMnyQv5bHwkGvY9C0BWG"
end

Spree.user_class = "Spree::User"
