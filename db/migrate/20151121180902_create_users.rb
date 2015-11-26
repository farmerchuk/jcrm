class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :time_zone
      t.boolean :two_factor
      t.string :two_factor_pin
      t.string :phone_number
      t.string :role_id
      t.string :password_digest
      t.timestamps
    end
  end
end
