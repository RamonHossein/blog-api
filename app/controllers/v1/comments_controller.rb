module V1
  class CommentsController < ApplicationController
    before_action :set_post
    before_action :set_comment, only: [:update, :destroy]

    # GET / posts / :post_id / comments / :id
    def index
      @comments = @post.comments.order('created_at DESC')
      json_response(@comments)
    end

    # POST / posts / :post_id / comments
    def create
      @comment = @post.comments.create!(comment_params)
      json_response(@comment, :created)
    end

    # PUT / posts / :post_id / comments / :id
    def update
      @comment.update(comment_params)
      head :no_content
    end

    # DELETE / posts / :post_id / comments / :id
    def destroy
      @comment.destroy
      head :no_content
    end

    private

      def comment_params
        params.permit(:author, :content)
      end

      def set_comment
        @comment =@post.comments.find_by!(id: params[:id]) if @post
      end

      def set_post
        @post = Post.find(params[:post_id])
      end
  end
end
