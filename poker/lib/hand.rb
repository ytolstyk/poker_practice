require 'deck'

class Hand
  
  attr_accessor :cards
  
  def initialize(deck)
    @deck = deck
    @cards = deck.draw(5)
  end
  
end