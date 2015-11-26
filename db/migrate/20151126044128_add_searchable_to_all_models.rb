class AddSearchableToAllModels < ActiveRecord::Migration
  def change
    add_column :accounts, :search_display_name, :string
    add_column :accounts, :search_key, :string
    add_column :contacts, :search_display_name, :string
    add_column :contacts, :search_key, :string
    add_column :opportunities, :search_display_name, :string
    add_column :opportunities, :search_key, :string
    add_column :notes, :search_display_name, :string
    add_column :notes, :search_key, :string    
  end
end
