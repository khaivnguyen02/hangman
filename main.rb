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

  def display_game_state
    puts "\nWord: #{display_word}"
    puts "Incorrect guesses: #{@incorrect_guesses}/#{@max_guesses}"
    puts "Guessed letters: #{@guessed_letters.join(', ')}"
  end

  def display_word
    @word.chars.map { |char| @guessed_letters.include?(char) ? char : '_' }.join(' ')
  end

  def guessed_letter(letter)
    letter.downcase!
    return if @guessed_letters.include?(letter)

    @guessed_letters << letter
    if @word.include?(letter)
      puts "Good guess!"
    else
      @incorrect_guesses += 1
      puts "Sorry, that letter is not in the word."
    end
  end
end

game = Hangman.new
game.play
