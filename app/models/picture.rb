class Picture < ActiveRecord::Base
  belongs_to :album

  mount_uploader :small_thumb, SmallThumbUploader
  
  validates :name, presence: true
end