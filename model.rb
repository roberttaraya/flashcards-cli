require './card'
require './deck'

class Model
  attr_reader :deck, :wrong, :right

  def initialize(input_file)
    @file = input_file
    @deck = load_deck
    @current_card = deck.deal!
    @wrong = @right = 0
  end

  def parse
    array_of_hashes = []
    array = File.readlines(@file)
    array.delete("\n")
    # p array.each_slice(2) {|d,t| p "def: #{d} \nterm: #{t}"}
    array.each_slice(2) {|d,t| array_of_hashes << Hash[:definition => d.chomp, :term => t.chomp]}
    array_of_hashes
  end

  def get_cards_from_parsed_data
    cards = []
    parse.each do |data|
      cards << Card.new(data)
    end
    cards
  end

  def load_deck
    deck = Deck.new
    get_cards_from_parsed_data.each do |card|
      deck.add(card)
    end
    deck.shuffle!
  end

  def validate_guess(guess)
    guess == @current_card.term ? @right += 1 : @wrong += 1
    guess == @current_card.term
  end

  def get_current_card_definition
    @current_card.definition
  end

  def next_card!
    @current_card = deck.deal!
  end

end

model = Model.new('flashcard_samples.txt')
