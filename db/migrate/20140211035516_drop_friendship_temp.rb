class DropFriendshipTemp < ActiveRecord::Migration
  def change
    drop_table :friendship_temps
  end
end
