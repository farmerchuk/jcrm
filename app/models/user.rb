class User < ActiveRecord::Base
  belongs_to :role
  has_many :opportunity_users
  has_many :opportunities, through: :opportunity_users
  has_many :notes

  before_save :generate_searchable

  has_secure_password validations: false

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true, numericality: {only_integer: true},
    length: { is: 10 }
  validates :password, presence: true, length: { minimum: 8, maximum: 16 }, on: :create
  validates_confirmation_of :password, on: :create

  def is_admin?
    self.role.name == "Admin"
  end

  private

  def generate_searchable
    self.search_display_name = "#{self.first_name} #{self.last_name}"
    self.search_key = (self.first_name + self.last_name).gsub(/[^0-9a-z]/i, '').downcase
  end
end
