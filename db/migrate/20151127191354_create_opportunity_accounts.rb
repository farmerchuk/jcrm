class CreateOpportunityAccounts < ActiveRecord::Migration
  def change
    create_table :opportunity_accounts do |t|
      t.integer :opportunity_id
      t.integer :account_id
      t.timestamps
    end
  end
end
