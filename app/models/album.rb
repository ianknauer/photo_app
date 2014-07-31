class Album <  ActiveRecord::Base
  belongs_to :customer
  has_many :pictures

  validates :name, presence: true
end