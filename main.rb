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

  def game_over?
    @incorrect_guesses >= @max_guesses || !display_word.include?('_')
  end

  def play
    until game_over?
      display_game_state
      print "\nEnter a letter to guess: "
      guess = gets.chomp
      guessed_letter(guess)
    end

    display_game_state
    if @incorrect_guesses >= @max_guesses
      puts "Sorry, you lost! The word was: #{@word}"
    else
      puts "Congratulations! You guessed the word!"
    end
  end
end

game = Hangman.new
game.play
