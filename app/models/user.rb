class User < ApplicationRecord
  has_many :practices
  has_many :thoughts, through: :practices
end
