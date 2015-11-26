class Product < ActiveRecord::Base
  has_many :transactions
  has_many :opportunities, through: :transactions
end
