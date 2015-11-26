class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :opportunity_id
      t.integer :product_id
      t.integer :quantity
      t.timestamps
    end
  end
end
