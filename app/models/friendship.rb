class Friendship < ActiveRecord::Base
  attr_accessor :friend_name

  # belongs_to :requester, :primary_key => "id", :class_name => "User", :foreign_key => "requester"
  # belongs_to :receiver, :primary_key => "id", :class_name => "User", :foreign_key => "receiver"
  
  # belongs_to :friend, :class_name => "User"


  validates :requester_id, presence: true
  validates :receiver_id, presence: true
  validates :status, presence: true
end
