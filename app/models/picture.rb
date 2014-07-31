class Picture < ActiveRecord::Base
  belongs_to :album
  
  validates :name, presence: true
end