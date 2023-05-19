class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.references :requester, foreign_key: { to_table: :users }, null: false
      t.references :receiver, foreign_key: { to_table: :users }, null: false
      t.string :status, default: 'pending'
      t.timestamps
    end

    add_index :friend_requests, [:requester_id, :receiver_id], unique: true
  end
end
