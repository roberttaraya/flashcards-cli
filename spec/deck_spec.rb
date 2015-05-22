require "spec_helper.rb"
require_relative "../lib/deck"

describe Deck do
  let(:deck) { Deck.new }

  describe "#cards" do
    it "returns array of cards" do
      expect(deck.cards).to be_an Array
    end
  end

  describe "#add" do
    it "adds a card to cards" do
      card = "I'm a card"
      deck.add(card)
      expect(deck.cards.count).to eq 1
      expect(deck.cards.first).to eq card
    end
  end

  describe "#any?" do
    context "when there are no cards" do
      it "returns false" do
        expect(deck.cards.count).to eq 0
        expect(deck.any?).to be_falsey
      end
    end

    context "when there are cards present" do
      it "returns true" do
        card = "I'm a card"
        deck.add(card)
        expect(deck.cards.count).to eq 1
        expect(deck.any?).to be_truthy
      end
    end
  end

  describe "#deal!" do
    it "deals a card" do
      deck.add("card1")
      deck.add("card2")
      expect(deck.deal!).to eq "card2"
    end
  end

  describe "#shuffle!" do
    it "returns a shuffled the deck of cards" do
      deck.add("card1")
      deck.add("card2")
      deck.add("card3")
      expect(deck.cards).to eq ["card1", "card2", "card3"]
      deck.shuffle!
      expect(deck.cards).to_not eq ["card1", "card2", "card3"]
    end
  end
end
