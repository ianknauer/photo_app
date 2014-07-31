class Album <  ActiveRecord::Base
  belongs_to :customer
  has_many :photos

  validates :name, presence: true
end