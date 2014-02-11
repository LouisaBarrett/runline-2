class Friendship < ActiveRecord::Base
  attr_accessor :friend_name

  belongs_to :user 
  belongs_to :friend, :class_name => "User"

  validates :requester, presence: true
  validates :receiver, presence: true
  validates :status, presence: true
end
