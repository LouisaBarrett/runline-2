class FixColumnNames < ActiveRecord::Migration
  def change
    rename_column :friendships, :user_id, :requester
    rename_column :friendships, :friend_id, :receiver
  end
end
