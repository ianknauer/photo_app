class Customer < ActiveRecord::Base
  belongs_to :user
  has_many :albums

  validates :name, presence: true
  validates :phone, presence: true
  validates :email, presence: true
end