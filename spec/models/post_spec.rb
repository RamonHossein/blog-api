require 'rails_helper'

RSpec.describe Post, type: :model do
  # association test
  # ensure Post model has a 1:m relationship with the Comment model
  it { should have_many(:comments).dependent(:destroy) }
  # validation tests
  # ensure columns title, content and created_by are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:created_by) }
end
