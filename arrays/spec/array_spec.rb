require "rspec"
require "array"

RSpec.describe Array do
  subject(:array) { [1, 2, 3, 4, 1, 2, -3, 0] }
  
  describe "#my_uniq" do
    its(:my_uniq) { should eq ([1, 2, 3, 4, -3, 0]) }
  end
  
  describe "#two_sum" do
    its(:two_sum) { should eq ([[2, 6]]) }
  end
  
  describe "#my_transpose" do
    let(:matrix1) { [[1, 2, 3], [4, 5, 6], [7, 8, 9]] }
    let(:matrix2) { [[1, 2, 3], [4, 5, 6]] }
    
    it "transposes a square matrix" do
      expect(matrix1.my_transpose).to eq([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
    end
    
    it "transposes a non-square matrix" do
      expect(matrix2.my_transpose).to eq([[1, 4], [2, 5], [3, 6]])
    end
  end
end