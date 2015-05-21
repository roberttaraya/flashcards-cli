class View
  def greeting
    puts "Welcome to the most amazing text based Ruby flavoured quiz programme evah writens. First question, hotshot:"
  end

  def wrong_answer
    sadness = ["That's right! If by 'right,' I mean 'totally wrong.'", "Don't make me call your mom.", "INCORRECT!","Survey says...[X][X][X]", "All signs point to no.", "I'll take 'Not a Chance' for $500, Alex."]
    puts sadness.sample
  end

  def right_answer
    happiness = ["Good job! Those eight years of middle school really paid off!", "DING DING DING!", "Congratulations! Here's your $120K Jr. developer job!", "Correct!", "Damn skippy!"]
    puts happiness.sample
  end

  def guess
    guessiness = ["So you think the answer is: ", "GUESS: ", "Refers to: ", "Might be...: ", "Are you willing to put down money on: ", "Bet you $1 it's: "]
    print guessiness.sample
  end

  def display_definition(string)
    puts
    puts string
  end

  def next_question
    puts "How about another..."
  end

  def report(right, wrong)
    genius_names = ["Ken Jennings", "Albert Einstein", "Nicolas Tesla", "Linus Torvald", "Yukihiro Matsumoto", "Marie Curie"]
    puts "-"*60
    puts "All right, #{genius_names.sample}. Here's how you did:"
    puts "-"*60
    puts "Right answers: #{right} | Wrong answers: #{wrong}"
    puts "Accuracy: #{((right.to_f * 100) / (right + wrong)).to_i}%"
    puts "Better study up: next time, the questions will be tougher"
    puts "and the commentary will be meaner. Bring it."
    puts "*"*28 + "END" + "*"*29
  end
end


