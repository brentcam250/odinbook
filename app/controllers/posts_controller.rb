class PostsController < ApplicationController
    
    def new 
        @post = Post.new
    end

    def create 
        @post = Post.new(post_params)

        respond_to do |format|
          if @post.save
            format.html { redirect_to @post, notice: 'post was successfully created.' }
            format.json { render :show, status: :created, location: @post }
          else
            format.html { render :new }
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
    end

    #this will act like timeline feature, sort newest posts for the currently logged in user
    def index
        #@posts = Post.all
        if(current_user)
            friends = current_user.friends.ids
            @posts = Post.where(user_id: friends)
            
            @friends = User.where(id: friends)

            @comment = Comment.new
            @like = Like.new
        else
            @posts = Post.first
            
            @friends = nil
        end

        #friendslist 
    end

    def show
        @post = Post.find(params[:id])
    end

    private 

    def post_params 
        params.require(:post).permit(:user_id, :content)
    end
  end
  