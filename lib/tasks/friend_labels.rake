  namespace :friend_labels do
    desc "reset known invalid values"
    task :reset_invalid do
      require 'active_record'
      require 'db/connection'
      DB::Connection.establish

      sql = "UPDATE friendships SET user_id=NULL WHERE email=''"
      ActiveRecord::Base.connection.execute(sql)
    end
  end

