class NoteAccount < ActiveRecord::Base
  belongs_to :note
  belongs_to :account
end
