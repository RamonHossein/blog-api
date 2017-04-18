class Comment < ApplicationRecord
  # model association
  belongs_to :post
  # validations
  validates_presence_of :author
  validates_presence_of :content
end
