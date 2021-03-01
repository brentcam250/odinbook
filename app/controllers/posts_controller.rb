class PostsController < ApplicationController
    
    #this will act like timeline feature, sort newest posts for the currently logged in user
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end
  end
  