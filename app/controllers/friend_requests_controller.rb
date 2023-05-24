class FriendRequestsController < ApplicationController
  def index
    @friend_requests = FriendRequest.all
  end
  
  def new
    @friend_request = FriendRequest.new
  end

  def create 
    @friend_request = FriendRequest.new(friend_request_params)
  end

  private 
    # Only allow a list of trusted parameters through.
    def friend_request_params 
      params.require(:friend_request).permit(:requester_id, :receiver_id)
    end
end
