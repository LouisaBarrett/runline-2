class Friendship < ActiveRecord::Base
  attr_accessor :friend_name

  belongs_to :requester, :primary_key => "id", :class_name => "User", :foreign_key => "requester_id"
  belongs_to :receiver, :primary_key => "id", :class_name => "User", :foreign_key => "receiver_id"
<<<<<<< HEAD
=======

>>>>>>> master
  belongs_to :friend, :class_name => "User"

  validates :requester_id, presence: true
  validates :receiver_id, presence: true
  validates :status, presence: true
end
