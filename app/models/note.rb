class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :noteable, polymorphic: true

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
