class FriendshipController < ApplicationController
    
    def index
        @friendships = Friendship.all
    end
    # GET /friendships/new
    def new 
        @friendship = Friendship.new
    end

    # POST /friendships or /friendships.json
    def create
        @friendship = Friendship.find(params[:friendship_params])
        return unless @friend_request.save

        redirect_to request.referrer
    end
    
    
    private
    # Only allow a list of trusted parameters through.
    def friendship_params
        params.require(:friendship).permit(user_id, friend_id)
    end
end
    
    