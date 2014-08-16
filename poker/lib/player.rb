require_relative "hand"
require_relative "deck"

class Player
  attr_reader :hand, :deck, :fold
  
  def initialize(deck)
    @deck = deck
    @hand = Hand.new(deck)
    @money = 10000
    @current_bet = 0
    @fold = false
  end
  
  def turn(game)
    if fold
      puts "You cannot play this turn, as you have folded."
      return
    end
    
    begin
      action = action_prompt
      perform_action(action, game)
      return if fold
      prompt_draw
    rescue DrawError => error
      puts error.message
      retry
    end
  end
  
  def action_prompt
    puts "(F)old, (C)all, or (R)aise?"
    action = gets.chomp.downcase
    raise InputError unless ["f", "c", "r"].include?(action)
    action
  end
  
  def perform_action(action, game)
    case action
    when "f" ; @fold = true
    when "c" ; call(game)
    when "r" ; raise_bet(game)
    end
  end
  
  def call(game)
    ante = game.ante
    @money = ante - @current_bet
  end
  
  def raise_bet(game)
  end
  
  def replace_cards(indices)
    valid_indices?(indices)
    indices.each do |index|
      hand[index] = deck.draw(1)
    end
  end
  
  def valid_indices?(indices)
    raise DrawError unless indices.all? { |i| i.between?(0, 4) }
    raise DrawError unless indices == indices.uniq
  end
end