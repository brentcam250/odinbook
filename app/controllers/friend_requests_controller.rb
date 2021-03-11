class FriendRequestsController < ApplicationController
    
    
    def create 
        # requester = current_user.id
        # requestee = params[:requestee_id]
        @request = FriendRequest.new(request_params)
        # @request.requester_id = requester
        # @request.requestee_id = requestee
        @previously_exists = FriendRequest.where(request_params)
        # @previously_exists_flag = false
        
        unless (@previously_exists.nil?)
            # @previously_exists_flag = true
            redirect_back fallback_location: posts_url
            return
        end

    respond_to do |format|
        if @request.save
    
            # redirect_back fallback_location: posts_url
            format.html { redirect_back fallback_location: posts_url, notice: 'friend was requested' }
            #format.json { render :show, status: :created, location: @user }
        else
            format.html { render :new }
            format.json { render json: @request.errors, status: :unprocessable_entity }
        end
        end
    end

    def accept 
        @request = FriendRequest.find(params[:id])
        @request.accept 
        #redirect_to 'root'
        redirect_back fallback_location: posts_url
    end

    def decline
        @request = FriendRequest.find(params[:id])
        @request.decline
        # redirect_to 'posts#index'
        redirect_back fallback_location: posts_url

    end

    private 

    def request_params
        params.require(:friend_request).permit(:requester_id, :requestee_id)
    end

end