class EmptyDeckError < StandardError
  def message
    "There aren't enough cards in the deck."
  end
end