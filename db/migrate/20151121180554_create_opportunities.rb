class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.string :name
      t.integer :stage_id
      t.integer :account_id
      t.integer :user_id
      t.timestamps
    end
  end
end
