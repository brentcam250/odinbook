class UsersController < ApplicationController
    
    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
        @posts = Post.where(user_id: params[:id])
    end

    def friends_list
        friends = current_user.friends.ids

        @friends = User.where(user_id: friends)

    end
end
