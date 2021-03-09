class PostsController < ApplicationController
    
    #this will act like timeline feature, sort newest posts for the currently logged in user
    def index
        #@posts = Post.all
        if(current_user)
            friends = current_user.friends.ids
            @posts = Post.where(user_id: friends)
            
            @friends = User.where(id: friends)

            @comment = Comment.new
        else
            @posts = Post.first
            
            @friends = nil
        end

        #friendslist 
    end

    def show
        @post = Post.find(params[:id])
    end
  end
  