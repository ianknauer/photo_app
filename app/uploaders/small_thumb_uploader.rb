class SmallThumbUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process :resize_to_fill => [236,166]
  if Rails.en.production?
    storage :fog
  end
end