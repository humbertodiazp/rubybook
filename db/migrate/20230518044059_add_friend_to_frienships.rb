class AddFriendToFrienships < ActiveRecord::Migration[7.0]
  def change
    add_reference :friendships, :friend, references: :users,
                  foreign_key: { to_table: :users }
  end
end 