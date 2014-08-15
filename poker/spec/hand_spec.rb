require 'rspec'
require 'hand'

RSpec.describe Hand do
  subject(:hand) { Hand.new(Deck.new) }
  
  it "should hold five cards" do
    expect(hand.cards.count).to eq(5)
  end
  
  describe "#type" do
    it "correctly identifies a straight flush" do
      straight_flush =  Hand.new(Deck.new) 
      straight_flush.cards = [
        Card.new(2, :hearts),
        Card.new(3, :hearts),
        Card.new(4, :hearts),
        Card.new(5, :hearts),
        Card.new(6, :hearts)
      ]
      
      expect(straight_flush.type).to eq([:straight_flush, 6, 6])
    end
    
    it "correctly identifies four of a kind" do
      hand = Hand.new(Deck.new)
      hand.cards = [
        Card.new(5, :hearts),
        Card.new(5, :spades),
        Card.new(5, :clubs),
        Card.new(5, :diamonds),
        Card.new(6, :clubs)
      ]
      
      expect(hand.type).to eq([:four_kind, 5, 6])
    end
    
    it "correctly identifies a full house" do
      hand = Hand.new(Deck.new)
      hand.cards = [
        Card.new(3, :hearts),
        Card.new(3, :clubs),
        Card.new(3, :spades),
        Card.new(5, :diamonds),
        Card.new(5, :hearts)
      ]
      
      expect(hand.type).to eq([:full_house, 3, 5])
    end
    
    it "correctly identifies a flush" do
      hand = Hand.new(Deck.new)
      hand.cards = [
        Card.new(2, :hearts),
        Card.new(7, :hearts),
        Card.new(4, :hearts),
        Card.new(12, :hearts),
        Card.new(6, :hearts)
      ]
      
      expect(hand.type).to eq([:flush, 12, 7])
    end
    
    it "correctly identifies a straight" do
      hand = Hand.new(Deck.new)
      hand.cards = [
        Card.new(2, :hearts),
        Card.new(3, :clubs),
        Card.new(4, :hearts),
        Card.new(5, :diamonds),
        Card.new(6, :clubs)
      ]
      
      expect(hand.type).to eq([:straight, 6, 6])
    end
    
    it "correctly identifies three of a kind" do
      hand = Hand.new(Deck.new)
      hand.cards = [
        Card.new(3, :hearts),
        Card.new(3, :clubs),
        Card.new(3, :diamonds),
        Card.new(5, :hearts),
        Card.new(6, :hearts)
      ]
      
      expect(hand.type).to eq([:three_kind, 3, 6])
    end
  
    it "correctly identifies two pair" do
      hand = Hand.new(Deck.new)
      hand.cards = [
        Card.new(2, :hearts),
        Card.new(2, :clubs),
        Card.new(4, :hearts),
        Card.new(5, :hearts),
        Card.new(5, :diamonds)
      ]
      
      expect(hand.type).to eq([:two_pair, 5, 2])
    end
    
    it "correctly identifies one pair" do
      hand = Hand.new(Deck.new)
      hand.cards = [
        Card.new(2, :hearts),
        Card.new(2, :clubs),
        Card.new(4, :hearts),
        Card.new(5, :diamonds),
        Card.new(6, :hearts)
      ]
      
      expect(hand.type).to eq([:pair, 2, 6])
    end
    
    it "correctly identifies a high card" do
      hand = Hand.new(Deck.new)
      hand.cards = [
        Card.new(2, :hearts),
        Card.new(3, :clubs),
        Card.new(7, :hearts),
        Card.new(5, :hearts),
        Card.new(12, :hearts)
      ]
      
      expect(hand.type).to eq([:high_card, 12, 7])
    end
  end
  
end