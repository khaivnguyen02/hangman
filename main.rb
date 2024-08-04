class Hangman
  def initialize
    @word = select_word
    @guessed_letters = []
    @incorrect_guesses = 0
    @max_guesses = 6
  end

  def select_word
    word_list = File.readlines('google-10000-english-no-swears.txt').map(&:chomp)
    word_list.select { |word| word.length.between?(5, 12) }.sample
  end

  def play
    # TODO: Implement game logic
  end
end

game = Hangman.new
p game.select_word
