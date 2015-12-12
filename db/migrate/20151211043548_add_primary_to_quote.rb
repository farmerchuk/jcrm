class AddPrimaryToQuote < ActiveRecord::Migration
  def change
    add_column :quotes, :primary, :boolean
  end
end
