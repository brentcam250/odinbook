class LikesController < ApplicationController
    def new 
        @comment = Comment.new
    end

    def create 

        #check to see if current user has already liked this
        @liked_ids = Like.where(user_id: current_user.id).pluck("likeable_id")

        if params[:like]
            @post = Post.find(params[:like][:post])

        else 
            @post = Post.find(params[:post])
        end
        
        if @liked_ids.include? (@post.id)
            # post already liked
            redirect_to post_url(@post), notice: 'You already liked this'
        else
            @like = @post.likes.build(user_id: current_user.id  )
       

            respond_to do |format|

                if (@like.save)

                    format.html { redirect_to post_url(@post), notice: 'like was successfully created.' }
                    format.json { render :show, status: :created, location: @post }
                else
                    format.html { render :new }
                    format.json { render json: @like.errors, status: :unprocessable_entity }
                end
            end
        end
    end

    def destroy

    end
end
