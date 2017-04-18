require 'rails_helper'

RSpec.describe Comment, type: :model do
  # association test
  # ensure an Comment record belongs to a single Post record
  it { should belong_to(:post) }
  # validation tests
  # ensure columns author and content are present before saving
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:content) }
end
