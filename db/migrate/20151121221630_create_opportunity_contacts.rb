class CreateOpportunityContacts < ActiveRecord::Migration
  def change
    create_table :opportunity_contacts do |t|
      t.integer :opportunity_id
      t.integer :contact_id
      t.timestamps
    end
  end
end
