class Diff
   def initialize(user_stats, friend_stats)
   end

   def miles
    (current_user.total_distance_in_miles - @friend.total_distance_in_miles).round(2)
   end

end
