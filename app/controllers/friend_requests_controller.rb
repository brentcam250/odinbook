class FriendRequestController < ApplicationController
    
    
    def create 
        # requester = current_user.id
        # requestee = params[:requestee_id]
        @request = FriendRequest.new()
        # @request.requester_id = requester
        # @request.requestee_id = requestee

    respond_to do |format|
        if @request.save
    
            
            format.html { redirect_to @request, notice: 'friend was requested' }
            format.json { render :show, status: :created, location: @request }
        else
            format.html { render :new }
            format.json { render json: @request.errors, status: :unprocessable_entity }
        end
        end
    end

    def destroy

    end

end