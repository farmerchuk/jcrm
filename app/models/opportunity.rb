class Opportunity < ActiveRecord::Base
  belongs_to :user
  belongs_to :account
  belongs_to :opportunity_stage
  has_many :opportunity_contacts
  has_many :contacts, through: :opportunity_contacts
  has_many :transactions
  has_many :products, through: :transactions
  has_many :notes, as: :noteable

  before_save :generate_searchable

  validates :name, presence: true

  private

  def generate_searchable
    self.search_display_name = self.name
    self.search_key = self.name.gsub(/[^0-9a-z]/i, '').downcase
  end
end
