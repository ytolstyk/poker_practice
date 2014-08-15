require_relative "hand"
require_relative "deck"

class Player
  attr_reader :hand
  
  def initialize(deck)
    @deck = deck
    @hand = Hand.new(deck)
  end
end