class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :orders, through: :carted_product
  has_many :carted_products
end
