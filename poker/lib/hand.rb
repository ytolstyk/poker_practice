require 'deck'

class Hand
  
  attr_accessor :cards
  
  def initialize(deck)
    @deck = deck
    @cards = deck.draw(5)
  end
  
  def type
    hands = [straight_flush, four_kind, full_house, flush, straight,
      three_kind, two_pair, pair, high_cards]
    
    hands.each do |method|
      return method if method
    end
  end
  
  def straight_flush
  end
  
  def four_kind
  end
  
  def full_house
  end
  
  def flush
  end
  
  def straight
  end
  
  def three_kind
    if values_count.values.count == 3 && values_count.values.max == 3
  end
  
  def two_pair
    if values_count.values.count == 3
      results = [:two_pair]
      
    end
    
    false
  end
  
  def pair
    if values_count.values.count == 4
      results = [:pair]
      cards_remaining = values_count.keys
      values_count.each do |k, v|
        if v == 2
          results << k 
          cards_remaining.delete(k)
        end
      end
      return results + cards_remaining.sort.reverse.take(1)
    end
    
    false
  end
  
  def high_cards
    result = card_values.sort.reverse.take(2)
    result.unshift(:high_card)
  end
  
  def values_count
    counts = Hash.new { |h, k| h[k] = 0 }
    card_values.each do |value|
      counts[value] += 1
    end
    counts
  end
  
  def card_values
    cards.map { |card| card.value }
  end
  
end