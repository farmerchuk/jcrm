class AddSearchableToUsers < ActiveRecord::Migration
  def change
    add_column :users, :search_display_name, :string
    add_column :users, :search_key, :string
  end
end
