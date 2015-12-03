class NoteContact < ActiveRecord::Base
  belongs_to :note
  belongs_to :contact
end
