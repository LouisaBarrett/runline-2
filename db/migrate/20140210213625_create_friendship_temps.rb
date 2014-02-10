class CreateFriendshipTemps < ActiveRecord::Migration
  def change
    create_table :friendship_temps do |t|
      t.integer :requester
      t.integer :receiver
      t.string :status

      t.timestamps
    end
    add_index :friendship_temps, :requester
    add_index :friendship_temps, :receiver
  end
end
