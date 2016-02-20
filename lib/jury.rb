class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(member)
    @members << member
  end

  def cast_votes(finalists)
    votes = {}
    finalists.each do |finalist|
      votes[finalist] = 0
    end
    votes
  end
end
