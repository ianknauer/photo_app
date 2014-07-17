class User < ActiveRecord::Base
  has_many :customers

  validates :email, presence: true
  validates :password, presence: true, on: :create

  has_secure_password validations: false
end