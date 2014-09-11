CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.storage    = :aws
    config.aws_bucket = ENV.fetch('iank-photo-app')
    config.aws_acl    = :public_read
    config.asset_host = 'http://example.com'
    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

    config.aws_credentials = {
      access_key_id:     ENV.fetch('ENV[S3_KEY'),
      secret_access_key: ENV.fetch('ENV[S3_SECRET]')
    }
  else
    config.storage = :file
    config.enable_processing = Rails.env.development?
  end
end