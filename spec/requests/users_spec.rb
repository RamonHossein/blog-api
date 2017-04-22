require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  # initialize tests data
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except("Authorization") }
  let(:valid_attributes) { attributes_for(:user, password_confirmation: user.password) }
  let(:invalid_attributes) { {} }

  # test suite for POST / signup
  describe "POST / signup" do
    context "when valid request" do
      before { post "/signup", params: valid_attributes.to_json, headers: headers }

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end

      it "returns success message" do
        expect(json['message']).to match(/Account created successfully/)
      end

      it "returns an authentication token" do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context "when invalid request" do
      before { post "/signup", params: invalid_attributes.to_json, headers: headers}

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end

      it "returns failure message" do
        expect(json['message']).to match(/Validation failed: Password can't be blank, Name can't be blank, Email can't be blank, Password digest can't be blank/)
      end
    end
  end
end
