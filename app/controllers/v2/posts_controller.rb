module V2
  class PostsController < ApplicationController
    # GET / posts
    def index
      json_response({ message: "Our API responds to version V2" })
    end
  end
end
