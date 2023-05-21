class FriendRequestsController < ApplicationController
    def index
      @friend_requests = FriendRequest.all
    end
  
    def new
      @friend_request = FriendRequest.new
    end
 