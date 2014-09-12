class SmallThumbUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process :resize_to_fill => [236,166]
  if Rails.env.production?
    storage :fog
  end
end