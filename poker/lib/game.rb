require_relative "player"
require_relative "hand"
require_relative "deck"

class Poker
  def initialize(*players)
    @players = players.each {|player| player.new}
    @deck = Deck.new
  end
  
  def play
    until call.all? {|i| i = true}
      call = []
      @players.each do |player|
        call << player.turn(@deck)
      end
    end
    call_victory
  end
end

if $PROGRAM_NAME == __FILE__
  game = Poker.new(HumanPlayer, HumanPlayer)
  game.play
end