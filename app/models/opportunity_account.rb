class OpportunityAccount < ActiveRecord::Base
  belongs_to :opportunity
  belongs_to :account
end
