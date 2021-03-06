# Defines the game mechanics of the survivr game and manages the game's tribes
class Game
  attr_reader :tribes

  def initialize(*tribes)
    @tribes = tribes
  end

  def add_tribe(tribe)
    @tribes.push(tribe)
  end

  def immunity_challenge
    losing_tribe = @tribes.sample
    puts "#{losing_tribe} has lost the immunity challenge and must vote out a "\
         'member.'
    losing_tribe
  end

  def clear_tribes
    @tribes = []
  end

  def merge(name)
    members = []
    @tribes.each do |tribe|
      members += tribe.members
    end

    clear_tribes

    add_tribe(Tribe.new(name: name, members: members))

    @tribes[0]
  end

  def individual_immunity_challenge
    winner = @tribes[0].members.sample
    puts "#{winner} has won the individual challenge and is immune "\
         'from being eliminated.'
    winner
  end
end
