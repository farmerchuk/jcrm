class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :region
      t.string :postal_code
      t.string :country
      t.integer :industry_id
      t.string :website
      t.timestamps
    end
  end
end
