class Hangman
  def initialize
    @dictionary = load_dictionary
    @secret_word = select_word
    @guessed_letters = []
    @remaining_guesses = 6
  end

  def load_dictionary
    # TODO: Implement dictionary loading
  end

  def select_word
    # TODO: Implement word selection
  end

  def play
    # TODO: Implement game logic
  end
end

game = Hangman.new
game.play
