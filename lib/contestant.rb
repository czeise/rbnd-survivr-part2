# Defines contestants for the survivr game
class Contestant
  attr_reader :name

  def initialize(name)
    @name = name.green
  end

  def to_s
    @name
  end
end
