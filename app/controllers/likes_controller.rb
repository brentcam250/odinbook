class LikesController < ApplicationController
    def new 
        @comment = Comment.new
    end

    def create 
        if params[:like]
            @post = Post.find(params[:like][:post])

        else 
            @post = Post.find(params[:post])
        end
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

    def destroy

    end
end
