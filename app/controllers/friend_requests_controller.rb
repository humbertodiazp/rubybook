class FriendRequestsController < ApplicationController
  def index
    @friend_requests = FriendRequest.all
  end
  
  def new
    @friend_request = FriendRequest.new
  end

  # POST /friend_request and generate friend_request id
  # Which can then be called on by the accept_friend_request method below
  def create
    @friend_request = FriendRequest.new(request_params)
    
    if @friend_request.save
      redirect_to user_path(@friend_request.requestor), notice: 'Friend request sent!'
    else
      render :new
    end
  end

  # Use the friend_request_id generated in the above create method
  # Call on the user method accept_friend_request(friend_request) 
  # Adds friend_id to friendship table 
  def accept_friend_request
    friend_request = FriendRequest.find(params[:id])
    current_user.accept_friend_request(friend_request)
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.destroy
    redirect_to user_path(@friend_request.receiver)
  end

  private 
    # Only allow a list of trusted parameters through.
    def request_params 
      params.require(:friend_request).permit(:requester_id, :receiver_id)
    end
end
