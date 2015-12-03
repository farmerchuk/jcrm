class Account < ActiveRecord::Base
  has_many :account_contacts
  has_many :contacts, through: :account_contacts
  has_many :opportunity_accounts
  has_many :opportunities, through: :opportunity_accounts
  has_many :notes, as: :noteable
  belongs_to :industry

  before_save :generate_searchable

  validates :name, presence: true, uniqueness: true, length: {minimum: 3}
  validates :street, presence: true
  validates :city, presence: true
  validates :region, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true
  validates :industry_id, presence: true
  validates :website, presence: true

  private

  def generate_searchable
    self.search_display_name = self.name
    self.search_key = self.name.gsub(/[^0-9a-z]/i, '').downcase
  end
end
