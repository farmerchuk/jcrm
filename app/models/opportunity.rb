class Opportunity < ActiveRecord::Base
  belongs_to :user
  belongs_to :account
  belongs_to :opportunity_stage
  has_many :opportunity_contacts
  has_many :contacts, through: :opportunity_contacts
  has_many :transactions
  has_many :products, through: :transactions
  has_many :notes, as: :noteable
end
