class CreateOpportunityUsers < ActiveRecord::Migration
  def change
    create_table :opportunity_users do |t|
      t.integer :opportunity_id
      t.integer :user_id
      t.timestamps
    end
  end
end
