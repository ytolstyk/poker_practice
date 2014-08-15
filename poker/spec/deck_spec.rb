require 'rspec'
require 'deck'

RSpec.describe Deck do
  subject(:deck) { Deck.new }
  
  it "should start containing 52 cards" do
    expect(deck.size).to eq(52)
  end
  
  it "should have a top card" do
    expect(deck.cards[0].class).to eq(Card)
  end
  
  describe 
end