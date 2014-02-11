class AddIndicesToFriendship < ActiveRecord::Migration
  def change
    add_index :friendships, :requester
    add_index :friendships, :receiver
  end
end
