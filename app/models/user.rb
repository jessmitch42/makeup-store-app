class User < ActiveRecord::Base
  #User has one cart
  has_many :cart_item
  has_many :orders
  has_secure_password
end
