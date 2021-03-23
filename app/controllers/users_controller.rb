class UsersController < ApplicationController
    
    def index
        @users = User.all

        @friend_request = FriendRequest.new 

        @outgoing_requests_ids = FriendRequest.where(requester_id: current_user.id).pluck("requestee_id")
    end
    
    def show
        @user = User.find(params[:id])
        @posts = Post.where(user_id: params[:id]).order(created_at: :desc)

        @friend_request = FriendRequest.new 

        #@outgoing_requests = FriendRequest.where(requester_id: current_user.id)

        @outgoing_requests_ids = FriendRequest.where(requester_id: current_user.id).pluck("requestee_id")

        #@test = FriendRequest.new 
        @friends = User.where(id: @user.friends.ids)
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @profile_photo = params[:profile_photo]
        @signed_url = User.generate_upload_url(params[:profile_photo])
        
        begin 
            respond_to do |format|
                if @user.update user_params
                    format.html { redirect_to @user, notice: 'User was successfully updated.' }
                    format.json { render :show, status: :ok, location: @user }
                else
                    format.html { render :edit }
                    format.json { render json: @user.errors, status: :unprocessable_entity }
                end
            end
        rescue 
            #sadness
            redirect_to @user, notice: 'User was NOT updated.'
        end
    end

    def friends_list
        friends = current_user.friends.ids

        @friends = User.where(user_id: friends)

    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :profile_photo)
    end

    def set_s3_direct_post 
        @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    end
end
