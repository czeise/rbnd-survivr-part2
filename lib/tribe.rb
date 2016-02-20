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
end
