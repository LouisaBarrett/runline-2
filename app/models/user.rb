require 'faraday'

class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true

  has_many :runs
  has_many :requesters, :class_name => "Friendship", :foreign_key => "requester_id"
  has_many :receivers, :class_name => "Friendship", :foreign_key => "receiver_id"
  has_many :friendships

  # has_many :friends, :through => :friendships, :foreign_key => "requester_id"

  def friends
    receivers = Friendship.where(:receiver_id => self.id).map(&:requester_id)
    requesters = Friendship.where(:requester_id => self.id).map(&:receiver_id)
    friends = receivers + requesters
    User.where(:id => friends.uniq)
  end

  # has_many :friends, ->(user) {Friendship.all}, :through => :friendships 

  # has_many :friends, :through => :friendships, :conditions => ->(user) {Friendship.where("receiver_id = :id or requester_id = :id", id: user.id)}
#  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "receiver"
#  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  scope :except, proc {|user| where("id != ?", user.id)}

end
