class Card
  attr_reader :definition, :term

  def initialize(hash_in = {:definition => "The class that this is", :term => "Card"})
    @definition = hash_in[:definition]
    @term = hash_in[:term]
  end
end
