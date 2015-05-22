require "spec_helper.rb"
require_relative "../lib/view"

describe View do
  let(:view) { View.new }

  describe "#greeting" do
    it "returns the welcome message" do
      expect{ view.greeting }.to output("Welcome to the most amazing text based Ruby flavoured quiz programme evah writens. First question, hotshot:\n").to_stdout
    end
  end

  describe "#wrong_answer" do
    it "returns the wrong answer comment" do
      sadness = [
        "That's right! If by 'right,' I mean 'totally wrong.'",
        "Don't make me call your mom.",
        "INCORRECT!","Survey says...[X][X][X]",
        "All signs point to no.",
        "I'll take 'Not a Chance' for $500, Alex."
      ]
      message = capture_stdout{ view.wrong_answer }
      expect(sadness).to include message.chomp
    end
  end

  describe "#right_answer" do
    it "returns the right answer comment" do
      happiness = [
        "Good job! Those eight years of middle school really paid off!",
        "DING DING DING!",
        "Congratulations! Here's your $120K Jr. developer job!",
        "Correct!",
        "Damn skippy!"
      ]
      message = capture_stdout{ view.right_answer }
      expect(happiness).to include message.chomp
    end
  end

  describe "#guess" do
    it "returns the right answer comment" do
      guessiness = [
        "So you think the answer is: ",
        "GUESS: ",
        "Refers to: ",
        "Might be...: ",
        "Are you willing to put down money on: ",
        "Bet you $1 it's: "
      ]
      message = capture_stdout{ view.guess }
      expect(guessiness).to include message.chomp
    end
  end

  describe "#display_definition" do
    let(:string) { "I'm the definition" }
    let(:message) { "\n" + string + "\n" }

    it "displays the definition" do
      expect{ view.display_definition(string) }.to output(message).to_stdout
    end
  end

  describe "#next_question" do
    let(:string) { "How about another..."}
    let(:message) { string + "\n" }

    it "asks player if they're read for another" do
      expect{ view.next_question }.to output(message).to_stdout
    end
  end

  describe "#report" do
    it "returns the final report" do
      genius_names = [
        "Ken Jennings",
        "Albert Einstein",
        "Nicolas Tesla",
        "Linus Torvald",
        "Yukihiro Matsumoto",
        "Marie Curie"
      ]
      message = capture_stdout{ view.report(20,10) }
      expect(message.chomp).to include "Right answers: 20"
      expect(message.chomp).to include "Wrong answers: 10"
    end
  end

  def capture_stdout(&block)
    old = $stdout
    $stdout = output = StringIO.new
    block.call
    output.string
  ensure
    $stdout = old
  end
end
