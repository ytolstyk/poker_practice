require "rspec"
require "stock"

RSpec.describe "#stock_pick" do
  let(:days) { [100, 42, 39, 52, 63, 72, 14] }
  
  it "should pick the most profitable days" do
    expect(stock_pick(days)).to eq([2, 5])
  end
  
end