class FriendRequest < ApplicationRecord
    belongs_to :requestor, class_name: 'User'
    belongs_to :requestee, class_name: 'User'

    def accept
        requestee.friends << requester
        requester.friends << requestee 
        self.destroy
    end

    def decline
        self.destroy
    end

end