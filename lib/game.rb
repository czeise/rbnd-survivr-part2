class Game
  attr_reader :tribes

  def initialize(tribe1, tribe2)
    @tribes = [tribe1, tribe2]
  end

  def add_tribe(tribe)
    @tribes.push(tribe)
  end
end
