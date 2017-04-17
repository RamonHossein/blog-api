class Post < ApplicationRecord
  # model association
  has_many :comments,dependent: :destroy
  # validations
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :created_by
end
