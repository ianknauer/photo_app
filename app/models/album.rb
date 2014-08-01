 class Album <  ActiveRecord::Base
  belongs_to :customer
  has_many :pictures
  
  accepts_nested_attributes_for :pictures

  validates :name, presence: true
end