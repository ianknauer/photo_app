CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => 'AKIAINVANZB2ALQRR2F',                # required
      :aws_secret_access_key  => 'qYJkoJimYJwHJ6B1mHMEYRA9KP9X7a0djYxUY5Ev',             # required
    }
    config.fog_directory  = 'iank-photo-app'                # required
  else
    config.storage = :file
    config.enable_processing = Rails.env.development?
  end
end