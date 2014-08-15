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
    if card_suits.uniq.count == 1
      return [:flush] + card_values.take(2)
    end
    false
  end

  def straight
    if values_count.values.count == 5
      max = card_values.max
      if card_values.all? { |i| i.between?(max - 4, max)}
        return [:straight, max, max]
      else
        return false
      end
    end
    
    false
  end
  
  def three_kind
    if values_count.values.count == 3 && values_count.values.max == 3
      results = [:three_kind]
      cards_remaining = values_count.keys
      values_count.each do |k, v|
        if v == 3
          results << k
          cards_remaining.delete(k)
        end
      end
      return results << cards_remaining.sort[-1]
    end
    
    false
  end
  
  def two_pair
    if values_count.values.count == 3
      results = [:two_pair]
      pairs = []
      values_count.each do |k, v|
        pairs << k if v == 2
      end
      return results + pairs.sort.reverse
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
    result = card_values.take(2)
    result.unshift(:high_card)
  end
  
  def values_count
    counts = Hash.new { |h, k| h[k] = 0 }
    card_values.each do |value|
      counts[value] += 1
    end
    counts
  end
  
  def card_suits
    cards.map { |card| card.suit }
  end
  
  def card_values
    cards.map { |card| card.value }.sort.reverse
  end
  
end