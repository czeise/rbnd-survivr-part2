# Defines the tribe and the tribal council voting process for the survivr game.
class Tribe
  attr_reader :name, :members

  def initialize(options = {})
    @name = options[:name]
    @members = options[:members]

    puts "The #{@name} tribe has been established with the following members:"
    @members.each do |member|
      puts "- #{member}"
    end
  end

  def to_s
    @name
  end

  def tribal_council(immune)
    @members.select { |member| member != immune }.sample
  end
end
