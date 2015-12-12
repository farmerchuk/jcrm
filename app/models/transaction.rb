class Transaction < ActiveRecord::Base
  belongs_to :quote
  belongs_to :product
end
