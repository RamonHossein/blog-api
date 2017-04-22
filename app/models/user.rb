class User < ApplicationRecord
  # encrypt password
  has_secure_password
  # model association
  has_many :posts, foreign_key: :created_by
  # valodations
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :password_digest
end
