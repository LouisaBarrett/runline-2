require 'faraday'

class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true

  has_many :runs
  # has_many :requesters, :class_name => "Friendship", :foreign_key => "requester"
  # has_many :receivers, :class_name => "Friendship", :foreign_key => "receiver"
#  has_many :friends, :through => :friendships
#  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "receiver"
#  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  scope :except, proc {|user| where("id != ?", user.id)}

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

end
