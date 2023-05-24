class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: :user_id
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :sent_friend_requests, foreign_key: :requester_id, class_name: "Friendship", dependent: :destroy
  has_many :received_friend_requests, foreign_key: :receiver_id, class_name: "Friendship", dependent: :destroy


  validates :email, uniqueness: true
  validates :username, uniqueness: true

  def add_friend(user)
    friends << user unless friends.include?(user)
  end

  def accept_friend_request
    friend_request = FriendRequest.find(params[:friend_request_id])
    user = friend_request.requestor
    current_user.add_friend(user)
    friend_request.destroy
    # Handle the response or redirect as needed
  end
  
  def remove_friend(user)
    friends.destroy(user)
  end





end
