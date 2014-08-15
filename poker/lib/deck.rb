require_relative './card.rb'

class Deck
  SUITS = [:spades, :clubs, :hearts, :diamonds]
  
  attr_reader :cards
  
  def initialize
    @cards = populate_deck
  end
  
  def populate_deck
    cards = []
    (2..14).to_a.product(SUITS).each do |card|
      cards << Card.new(card[0], card[1])
    end
    cards.shuffle
  end
  
  def size
    @cards.count
  end
end