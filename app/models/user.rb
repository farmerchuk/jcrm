class User < ActiveRecord::Base
  belongs_to :role
  has_many :opportunities
  has_many :notes, through: :noteable
end
