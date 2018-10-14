class User < ApplicationRecord
  has_many :practices
  has_many :thoughts, through: :practices
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
