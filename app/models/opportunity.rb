class Opportunity < ActiveRecord::Base
  belongs_to :opportunity_stage
  has_many :opportunity_accounts
  has_many :accounts, through: :opportunity_accounts
  has_many :opportunity_contacts
  has_many :contacts, through: :opportunity_contacts
  has_many :quotes
  has_many :note_opportunities
  has_many :notes, through: :note_opportunities
  has_many :opportunity_users
  has_many :users, through: :opportunity_users

  before_save :generate_searchable

  validates :name, presence: true

  private

  def generate_searchable
    self.search_display_name = self.name
    self.search_key = self.name.gsub(/[^0-9a-z]/i, '').downcase
  end
end
