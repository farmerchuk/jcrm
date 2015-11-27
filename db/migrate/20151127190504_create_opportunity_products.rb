class CreateOpportunityProducts < ActiveRecord::Migration
  def change
    create_table :opportunity_products do |t|
      t.integer :opportunity_id
      t.integer :product_id
      t.timestamps
    end
  end
end
