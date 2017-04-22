require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  # initialize tests data
  let(:user) { create(:user) }
  let!(:posts) { create_list(:post, 10, created_by: user.id) }
  let(:post_id) { posts.first.id }
  let(:headers) { valid_headers }

  # test suite for GET / posts
  describe "GET / posts" do
    before { get "/posts", params: {}, headers: headers }

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end

    it "returns posts" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
  end

  # test suite for GET / posts / :id
  describe "GET / posts / :id" do
    before { get "/posts/#{post_id}", params: {}, headers: headers }

    context "when the record exist" do
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end

      it "returns the post" do
        expect(json).not_to be_empty
        expect(json['id']).to eq(post_id)
      end
    end

    context "when the record does not exist" do
      let(:post_id) { 100 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Post/)
      end
    end
  end

  # test suite for POST / posts
  describe "POST / posts" do
    let(:valid_attributes) { { title: "title number one", content: "content about something", created_by: "1" }.to_json }
    let(:invalid_attributes) { { title: "title number one", created_by: "1"}.to_json }

    context "when the request is valid" do
      before { post "/posts", params: valid_attributes, headers: headers }

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end

      it "creates a posts" do
        expect(json['title']).to eq("title number one")
      end
    end

    context "when the request is invalid" do
      before { post "/posts", params: invalid_attributes, headers: headers }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end

      it "returns a validation failure message" do
        expect(response.body).to match(/Validation failed: Content can't be blank/)
      end
    end
  end

  # test suite for PUT / posts / :id
  describe "PUT / posts / :id" do
    let(:valid_attributes) { { title: "title number two" }.to_json }

    context "when the record exists" do
      before { put "/posts/#{post_id}", params: valid_attributes, headers: headers }

      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end

      it "updates the record" do
        expect(response.body).to be_empty
      end
    end
  end

  # test suite for DELETE / posts / :id
  describe "DELETE / posts / :id" do
    before { delete "/posts/#{post_id}", params: {}, headers: headers }

    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end
