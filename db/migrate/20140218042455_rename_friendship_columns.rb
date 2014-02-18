class RenameFriendshipColumns < ActiveRecord::Migration
  def change
    rename_column :friendships, :requester, :requester_id
    rename_column :friendships, :receiver, :receiver_id
  end
end
