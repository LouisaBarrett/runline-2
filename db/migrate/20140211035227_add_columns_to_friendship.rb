class AddColumnsToFriendship < ActiveRecord::Migration
  def change
    add_column :friendships, :requester, :integer
    add_column :friendships, :receiver, :integer
  end
end
