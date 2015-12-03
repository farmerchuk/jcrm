class NoteOpportunity < ActiveRecord::Base
  belongs_to :note
  belongs_to :opportunity
end
