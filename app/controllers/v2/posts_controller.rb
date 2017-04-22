module V2
  class PostsController < ApplicationController
    # GET / posts
    def index
      json_response({ message: "" })
    end
  end
end
