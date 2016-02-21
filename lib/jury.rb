# Defines the jury for the survivr game and gives it the ability to vote on the
# finalists and declare a winner.
class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(member)
    puts "#{member} has been added to the jury."
    @members << member
  end

  def cast_votes(finalists)
    votes = {}

    finalists.each do |finalist|
      votes[finalist] = 0
    end

    @members.each do |member|
      vote = finalists.sample
      votes[vote] += 1
      puts "#{member} votes for #{vote}."
    end

    votes
  end

  def report_votes(votes)
    votes.each do |finalist, total_votes|
      puts "#{finalist} received #{total_votes} votes."
    end
  end

  def announce_winner(votes)
    winner = votes.max_by { |_finalists, total_votes| total_votes }[0]
    puts "#{winner} has won Survivr!"
    winner
  end
end
