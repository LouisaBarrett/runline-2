require 'faraday'

class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true

  has_many :runs
  has_many :friendships
  # has_many :friendships, ->(user) { unscoped.where("friend_id = :id or user_id = :id", id: user.id) }
  # # has_many :friendships, ->(user) { where((:id => user.id) | (:friend_id => user.id)) }
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  scope :except, proc {|user| where("id != ?", user.id)}

  def all_friendships
    Friendship.where("friend_id = :id or user_id = :id", id: id)
  end

  def self.find_or_create_by_auth(user_data)
    where(:provider => user_data.provider, :uid => user_data.uid).first_or_create(
      username: user_data.first_name + " " + user_data.last_name,
      email: user_data.email,
      token: user_data.token
    )
  end

  def fetch_runs
    store = MapMyFitness::WorkoutStore.new(self.token)
    runs = store.workouts_by_user_in_last_days(self.uid, 14)
    runs.each do |run|
      Run.where(:mmf_identifier => run.id).first_or_create(
        user_id: User.find_by_uid(self.uid).id,
        name: run.name,
        distance: run.distance,
        run_time: run.duration,
        workout_datetime: run.started_at 
      )
    end
  end

  def self.invite_new_friend_email(email, username)
    link = "http://runline.tk"
    FriendRequestNotifier.invite_new_friend(email, username, link).deliver
  end


  def self.requestable_users(user)
    potential_friends = []
    where("id != ?", user.id).collect do |friend|
      if !user.total_approved_friends.include?(friend) && !user.total_pending_friends.include?(friend)
        potential_friends << friend
      end
    end
    potential_friends
  end

  def total_pending_friends
    total = pending_friends << pending_inverse_friends
    total.flatten
  end

  def total_approved_friends
    total = approved_friends << approved_inverse_friends
    total.flatten
  end

  def approved_friends
    approved_friendships.where(user_id: id).collect do |friendship|
      friendship.friend
    end
  end

  def approved_inverse_friends
    approved_inverse_friendships.where(friend_id: id).collect do |friendship|
      friendship.user
    end
  end

  def total_approved_friendships
    total = approved_friendships << approved_inverse_friendships
    total.flatten
  end

  def approved_friendships
    friendships.where(status: "approved")
  end

  def approved_inverse_friendships
    inverse_friendships.where(status: "approved")
  end

  def pending_friends
    pending_friendships.where(user_id: id).collect do |friendship|
      friendship.friend
    end
  end

  def pending_inverse_friends
    pending_inverse_friendships.where(friend_id: id).collect do |friendship|
      friendship.user
    end
  end

  def total_pending_friendships
    total = pending_friendships << pending_inverse_friendships
    total.flatten
  end

  def pending_friendships
    friendships.where(status: "pending")
  end

  def pending_inverse_friendships
    inverse_friendships.where(status: "pending")
  end

end
