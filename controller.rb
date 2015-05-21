require './view'
require './model'

class Controller
  attr_reader :view, :model
  
  def initialize(model, view)
    @model = model
    @view = view
  end

  def run
    view.greeting
    
    while model.deck.any?
      view.display_definition(model.get_current_card_definition)

      user_response = guess
      until model.validate_guess(user_response)
        view.wrong_answer
        user_response = guess
      end

      view.right_answer

      model.next_card!
    end

    view.report(model.right, model.wrong)
  end

  def guess
    view.guess
    gets.chomp
  end

end

Controller.new(Model.new("flashcard_samples.txt"), View.new).run