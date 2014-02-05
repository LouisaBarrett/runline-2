module ObjectCreationMethods
 
  def new_user(overrides = {})
    defaults = {username: "Bob", email: "bob@example.com"}
 
    User.new(defaults.merge(overrides))
  end
 
  def create_user(overrides = {})
    user = new_user(overrides)
    user.save
    user
  end

  def new_run(overrides = {})
    defaults = {user_id: 1, distance: 3000, run_time: 2000, workout_datetime: "2014-01-22T19:00:00+00:00"}

    Run.new(defaults.merge(overrides))
  end

  def create_run(overrides = {})
    run = new_run(overrides)
    run.save
    run
  end

  def new_friendship(overrides = {})
    defaults = {user_id: 1, friend_id: 2, status: "approved"}

    Friendship.new(defaults.merge(overrides))
  end

  def create_friendship(overrides = {})
    friendship = new_friendship(overrides)
    friendship.save
    friendship
  end 

end
