class CreateNoteAssociations < ActiveRecord::Migration
  def change
    create_table :note_accounts do |t|
      t.integer :note_id
      t.integer :account_id
      t.timestamps
    end

    create_table :note_contacts do |t|
      t.integer :note_id
      t.integer :contact_id
      t.timestamps
    end

    create_table :note_opportunities do |t|
      t.integer :note_id
      t.integer :opportunity_id
      t.timestamps
    end
  end
end
