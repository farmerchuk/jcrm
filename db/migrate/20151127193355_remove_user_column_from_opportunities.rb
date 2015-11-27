class RemoveUserColumnFromOpportunities < ActiveRecord::Migration
  def change
    remove_column :opportunities, :user_id
  end
end
