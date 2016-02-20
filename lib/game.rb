# Defines the game mechanics of the survivr game and manages the game's tribes
class Game
  attr_reader :tribes

  def initialize(tribe1, tribe2)
    @tribes = [tribe1, tribe2]
  end

  def add_tribe(tribe)
    @tribes.push(tribe)
  end

  def immunity_challenge
    @tribes.sample
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
    @tribes[0].members.sample
  end
end
