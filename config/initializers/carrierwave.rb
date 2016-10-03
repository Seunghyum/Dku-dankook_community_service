require 'carrierwave/orm/activerecord'
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

CarrierWave.configure do |config|
  config.permissions = 0600
  config.directory_permissions = 0700
  config.root = Rails.root
end
