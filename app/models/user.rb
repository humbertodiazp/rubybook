class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: [:facebook]


  has_many :posts, foreign_key: :user_id
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :sent_friend_requests, foreign_key: :requester_id, class_name: "Friendship", dependent: :destroy
  has_many :received_friend_requests, foreign_key: :receiver_id, class_name: "Friendship", dependent: :destroy


  validates :email, uniqueness: true
  validates :username, uniqueness: true

  def add_friend(friend)
    friends << friend unless friends.include?(friend)
  end

  def remove_friend(friend)
    friends.delete(friend)
  end

  def send_friend_request(receiver)
    sent_friend_requests.create(receiver: receiver)
  end

  def cancel_friend_request(receiver)
    sent_friend_requests.find_by(receiver: receiver).destroy
  end

  def accept_friend_request(requestor)
    request = received_friend_requests.find_by(requestor: requestor)
    return unless request

    friends << requestor
    request.destroy
  end

  def accept_friend_request(friend_request)
    user = friend_request.requestor
    current_user.add_friend(user)
    friend_request.destroy
    # Handle the response or redirect as needed
  end

  def reject_friend_request(requestor)
    request = received_friend_requests.find_by(requestor: requestor)
    request&.destroy
  end

  def pending_friend_requests
    received_friend_requests.where(accepted: false)
  end

  # omniauth 
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    user = User.find_by('email = ?', auth['info']['email'])
    if user.blank?
       user = User.new(
         {
          provider: auth.provider,
          uid: auth.uid,
          email: auth.info.email,
          password: Devise.friendly_token[0,20]
         }
       )
       user.save!
    end
    user
  end


end
