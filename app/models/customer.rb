class Customer < ActiveRecord::Base
  belongs_to :user
  has_many :albums

  before_save :generate_slug

  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true

  def generate_slug
    self.slug = self.name.gsub(' ', '-').downcase
  end
  
  def to_param
    self.slug
  end
end