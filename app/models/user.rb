require 'faraday'
class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true

  has_many :runs
  has_many :requesters, :class_name => "Friendship", :foreign_key => "requester_id"
  has_many :receivers, :class_name => "Friendship", :foreign_key => "receiver_id"
  has_many :friendships
end
