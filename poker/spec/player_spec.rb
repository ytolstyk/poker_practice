require 'rspec'
require 'player'

RSpec.describe Player do
  subject(:player) { Player.new(Deck.new) }
  
  it "should start with a hand" do
    expect(player.hand.class).to eq(Hand)
  end
  
  describe "#replace_cards" do
    it "should replace one card at index" do
      control_card = player.hand[0]
      old_card = player.hand[1]
      player.replace_cards([1])
      
      expect(player.hand[1]).to_not eq(old_card)
      expect(player.hand[0])to eq(control_card)
    end
    
    it "should replace multpile cards at indices" do
      old_cards = [player.hand[1], player.hand[2]]
    end
    
    it "should not replace more than 5 cards" do
      
    end
    
  end
  
  
end