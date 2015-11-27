class Contact < ActiveRecord::Base
  has_many :account_contacts
  has_many :accounts, through: :account_contacts
  has_many :opportunity_contacts
  has_many :opportunities, through: :opportunity_contacts
  has_many :notes, as: :noteable

  before_save :generate_searchable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, length: { is: 10 }, numericality: {only_integer: true}

  private

  def generate_searchable
    self.search_display_name = "#{self.first_name} #{self.last_name}"
    self.search_key = (self.first_name + self.last_name).gsub(/[^0-9a-z]/i, '').downcase
  end
end
