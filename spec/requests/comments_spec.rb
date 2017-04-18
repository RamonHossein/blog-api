require 'rails_helper'

RSpec.describe 'Comments API' do
  # initialize tests data
  let!(:posted) { create(:post) }
  let!(:comments) { create_list(:comment, 20, post_id: posted.id) }
  let(:post_id) { posted.id }
  let(:id) { comments.first.id }

  # test suite for GET / posts / :post_id / comments
  describe "GET / posts / :post_id / comments" do
    before { get "/posts/#{post_id}/comments" }

    context "when post exists" do
      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end

      it "returns all post comments" do
        expect(json.size).to eq(20)
      end
    end
  end

  # test suite for POST / posts / :post_id / comments
  describe "POST / posts / :post_id / comments" do
    let(:valid_attributes) { { author: "Anakin Skywalker", content: "content about a post" } }
    let(:invalid_attributes) { { content: "content about a post" } }

    context "when request attributes are valid" do
      before { post "/posts/#{post_id}/comments", params: valid_attributes }

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when an invalid request" do
      before { post "/posts/#{post_id}/comments", params: invalid_attributes }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end

      it "returns a failure message" do
        expect(response.body).to match(/Validation failed: Author can't be blank/)
      end
    end
  end

  # test suite for PUT / posts / :post_id / comments / :id
  describe "PUT / posts / :post_id / comments / :id" do
    let(:valid_attributes) { { author: "Luke Skywalker"} }

    before { put "/posts/#{post_id}/comments/#{id}", params: valid_attributes }

    context "when comment exist" do
      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end

      it "updates the comment" do
        updated_comment = Comment.find(id)
        expect(updated_comment.author).to match(/Luke Skywalker/)
      end
    end

    context "when comment does not exist" do
      let(:id) { 0 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns a not found message" do
        expect(response.body).to match(/Couldn't find Comment/)
      end
    end
  end

  # test suite for DELETE / posts / :post_id / comments / :id
  describe "DELETE / posts / :post_id / comments / :id" do
    before { delete "/posts/#{post_id}/comments/#{id}" }

    it "returns status code 204" do
      expect(response).to have_http_status(204)
    end
  end
end
