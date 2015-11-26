class CreateOpportunityStages < ActiveRecord::Migration
  def change
    create_table :opportunity_stages do |t|
      t.string :stage
      t.timestamps
    end
  end
end
