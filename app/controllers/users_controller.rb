class UsersController < ApplicationController
    
    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
        @posts = Post.where(user_id: params[:id]).order(created_at: :desc)

        @friend_request = FriendRequest.new 

        @outgoing_requests = FriendRequest.where(requester_id: current_user.id)
        @test = FriendRequest.new 
        @friends = User.where(id: @user.friends.ids)
    end

    def friends_list
        friends = current_user.friends.ids

        @friends = User.where(user_id: friends)

    end
end
