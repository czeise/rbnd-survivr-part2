require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

# For formatting the text a bit nicer...
def print_header(string)
  puts '*' * 80
  puts string.center(80)
  puts '*' * 80
end

print_header('Welcome to Survivr!')

#After your tests pass, uncomment this code below
#=========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
  8.times do
    @borneo.immunity_challenge.tribal_council('')
    puts
  end
end

def phase_two
  3.times do
    @merge_tribe.tribal_council(@borneo.individual_immunity_challenge)
    puts
  end
end

def phase_three
  7.times do
    @jury.add_member(@merge_tribe.tribal_council(@borneo.individual_immunity_challenge))
    puts
  end
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
print_header('Phase One: Pre-Merge')
phase_one #8 eliminations

print_header('Phase Two: Merge')
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new

print_header('Phase Three: Jury Phase')
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists

print_header("The finalists are #{finalists[0]} and #{finalists[1]}!")
vote_results = @jury.cast_votes(finalists) #Jury members report votes
puts
@jury.report_votes(vote_results) #Jury announces their 
puts

print_header('And the winner is...')
@jury.announce_winner(vote_results) #Jury announces final winner
