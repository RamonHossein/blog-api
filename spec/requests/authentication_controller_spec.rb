require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  # initialize tests data
  let!(:user) { create(:user) }
  let(:headers) { valid_headers.except("Authorization") }
  let(:valid_credentials) { { email: user.email, password: user.password }.to_json }
  let(:invalid_credentials) { { email: Faker::Internet.email, password: Faker::Internet.password }.to_json }

  # test suite for POST / auth / login
  describe "POST / auth / login" do
    #returns auth token when request is valid
    context "when request is valid" do
      before { post "/auth/login", params: valid_credentials, headers: headers }

      it "returns an authentication token" do
        expect(json['auth_token']).not_to be_nil
      end
    end

    #returns failure message when request is invalid
    context "when request is invalid" do
      before { post "/auth/login", params: invalid_credentials, headers: headers }

      it "returns a failure message" do
        expect(json['message']).to match(/Invalid credentials/)
      end
    end
  end
end
