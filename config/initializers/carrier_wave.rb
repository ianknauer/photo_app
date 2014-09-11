CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => 'AKIAITTM5YY2CCO6ZLBA',                # required
      :aws_secret_access_key  => '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',             # required
    }
    config.fog_directory  = 'iank-photo-app'                # required
  else
    config.storage = :file
    config.enable_processing = Rails.env.development?
  end
ends