class Quote < ActiveRecord::Base
  belongs_to :opportunity
  has_many :transactions

  validates :product_1_qty, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :product_2_qty, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :product_3_qty, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
