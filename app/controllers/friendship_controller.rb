class FriendshipController < ApplicationController
  def index
    @friendships = Friendship.all
  end
  
  def new 
    @friendship = Friendship.new
  end

  def create
    friend_request = FriendRequest.find(params[:friend_request_id])
  end
end

