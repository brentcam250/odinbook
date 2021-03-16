class CommentsController < ApplicationController
    def new 
        @comment = Comment.new
    end
    
    def create 
        #depending where comment is created from (show vs index) it may or may not come wrapped in comment param 
        if params[:comment]
            @post = Post.find(params[:comment][:post])
            @comment = @post.comments.build(content: params[:comment][:content], user_id: current_user.id)

        else 
            @post = Post.find(params[:post])
            @comment = @post.comments.build(content: params[:content], user_id: current_user.id)
        end
        respond_to do |format|

            if (@comment.save)

                format.html { redirect_to post_url(@post), notice: 'comment was successfully created.' }
                format.json { render :show, status: :created, location: @post }
            else
                format.html { render :new }
                format.json { render json: @comment.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :post)
    end
end
