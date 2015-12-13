class Quote < ActiveRecord::Base
  belongs_to :opportunity
  has_many :transactions

  validates :product_1_qty, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :product_2_qty, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :product_3_qty, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def value
    val_1 = self.product_1_qty * Product.find(1).price
    val_2 = self.product_2_qty * Product.find(2).price
    val_3 = self.product_3_qty * Product.find(3).price
    val_1 + val_2 + val_3
  end
end
