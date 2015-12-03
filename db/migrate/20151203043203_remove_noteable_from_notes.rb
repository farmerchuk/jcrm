class RemoveNoteableFromNotes < ActiveRecord::Migration
  def change
    remove_column :notes, :noteable_type
    remove_column :notes, :noteable_id
  end
end
