class FriendshipsController < ApplicationController
    
    #expects id = user id, friend_id of the new friend
    def create
        friend = Friend.find(params[:id])
        friend.frienships.build(params[:friend_id])
    end

    #expects friendship_id
    def destroy 
        friendship = Friendship.find(params[:friendship_id])

        if friendship.destroy 
            flash[:alert] = "friendship deleted"
        else
            flash[:alert] = "some problem deleting friendship"
            # redirect_to :root_url, notice: "friendship not found"
        end
    end
end