class RemoveColumnFromOpportunities < ActiveRecord::Migration
  def change
    remove_column :opportunities, :account_id
  end
end
