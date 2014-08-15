require 'rspec'
require 'tower'

RSpec.describe Tower do
  subject(:tower) { Tower.new }
  
  it "initializes one stack" do
    expect(tower.stacks).to eq([[1, 2, 3, 4], [], []])
  end
  
  describe "#move" do
    it "moves rings from one stack to another" do
      tower.move([1, 2])
      expect(tower.stacks).to eq([[2, 3, 4], [1], []])
    end
    
    it "stacks rings in the right order" do
      tower.move([1, 3])
      tower.move([1, 2])
      tower.move([3, 2])
      expect(tower.stacks).to eq([[3, 4], [1, 2], []])
    end
  end
  
  describe "#valid_move?" do
    it "returns true for valid move" do
      expect(tower.valid_move?([1, 2])).to be_true
    end
    
    it "returns false for invalid move from empty stack" do
      expect(tower.valid_move?([2, 3])).to be_false
    end
    
    it "returns false if invalid move from larger to smaller num" do
      tower.move([1, 2])
      expect(tower.valid_move?([1, 2])).to be_false
    end
  end
  
  describe "#won?" do
    let(:winning) { Tower.new([[], [1, 2, 3, 4], []]) }
    
    it "returns false if not won" do
      expect(tower.won?).to be_false
    end
  
    it "returns true if won" do
      expect(winning.won?).to be_true
    end
    
  end
end