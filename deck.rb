class Deck
  attr_reader :cards
  
  def initialize
    @cards = []
  end

  def add(card)
    cards << card
  end

  def any?
    cards.any?
  end

  def deal!
    cards.pop
  end

  def shuffle!
    cards.shuffle!
    self
  end
end