class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.integer :opportunity_id
      t.integer :user_id
      t.integer :product_1_qty
      t.integer :product_2_qty
      t.integer :product_3_qty
      t.timestamps
    end
  end
end
