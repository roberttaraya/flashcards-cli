require "spec_helper.rb"
require_relative "../lib/card.rb"

describe Card do
  let(:dt_hash) { {:definition => "Card definition", :term => "Card term"} }
  let(:card) { Card.new dt_hash }
  describe "#definition" do
    it "returns the definition of the card" do
      expect(card.definition).to eq dt_hash[:definition]
    end
  end

  describe "#term" do
    it "returns the definition of the card" do
      expect(card.term).to eq dt_hash[:term]
    end
  end
end
