class Calculator
  attr_reader :runs

  def initialize(runs)
    @runs = runs
  end

  def total_distance
    runs.collect(&:distance).reduce(0, :+)
  end

  def longest_run 
    longest_run = runs.max_by { |run| run.distance }
    longest_run.distance
  end

  def total_average_pace_per_mile
    total_distance = DistanceConverter.new(self.total_distance).miles
    total_seconds / total_distance
  end

  private

  def total_seconds
    runs.collect(&:run_time).reduce(0, :+).to_f
  end
end

# class RunCalculator < Calculator
#   def climb
#     total / distance
#   end
# end

# class RideCalculator < Calculator
#   def climb
#     distance / total
#   end
# end


# def index
#   @runs  = RunCalculator.new(user.runs)
#   @rides = RideCalculator.new(user.rides)
# end


# <div id="runs">
#   <%= render partial: 'stats', locals: {exercise: @runs} %>
# </div>

# <div id="rides">
#   <%= render partial: 'stats', locals: {exercise: @rides} %>
# </div>

# ### stats partial

# <div><%= exercise.climb %></div>

# ### rides view

# <div><%= rides.climb %></div>

# ### with polymorphism

# # exercise = runs
# exercise = rides

# <div><%= excericise.climb %></div>
