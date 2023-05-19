class FriendRequest < ApplicationRecord
    class FriendRequest < ApplicationRecord
        belongs_to :requester, class_name: 'User'
        belongs_to :receiver, class_name: 'User'
      
        validates :requester_id, presence: true
        validates :receiver_id, presence: true
      end
      
end
