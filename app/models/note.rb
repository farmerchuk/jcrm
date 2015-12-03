class Note < ActiveRecord::Base
  belongs_to :user
  has_many :note_accounts
  has_many :accounts, through: :note_accounts
  has_many :note_contacts
  has_many :contacts, through: :note_contacts
  has_many :note_opportunities
  has_many :opportunities, through: :note_opportunities

  before_save :generate_searchable

  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true

  private

  def generate_searchable
    self.search_display_name = self.title
    self.search_key = self.title.gsub(/[^0-9a-z]/i, '').downcase
  end
end
