require 'rails_helper'

RSpec.describe User, type: :model do
  # association test
  # ensure User model has 1:m relationship with Post model
  it { should have_many(:posts) }
  # validation tests
  # ensure columns name, email and password_digest are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end
