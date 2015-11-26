class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.string :noteable_type
      t.integer :noteable_id
      t.timestamps
    end
  end
end
