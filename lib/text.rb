# text.rb
# frozen_string_literal: true

# Text describing the game and rules/gameplay.
module Text
  # rubocop: disable Metrics
  # rubocop: disable Layout/LineLength
  def welcome_text
    puts "This game is Mastermind, below is how you play.\n\n"
    puts 'The game is played with either you creating a code for the computer to guess. Or the computer creating a code for you to guess.'
    puts 'The code will consist of four colours.'
    puts "These colours will be shown on a 2D board with the result of the current guess being on the left of the board and the current guess on the right of the board.\n\n"
    puts 'The left side, will consist of two colours.'
    puts 'Green if the guess consists of a chosen colour in the right place.'
    puts "Orange if the guess consists of a chosen colour but not in the right place.\n\n"
    puts 'The left side of the board will show you the current guess and be made up of a maximum of four colours, colours can be repeated.'
    puts "These are the availble colours:\n\n"
    puts "RED, BLUE, GREEN, ORANGE, PURPLE or PINK\n\n"
    puts "The board will look like this:\n\n"
    puts '----------------------'
    puts '| o o |              |'
    puts '|-+-+-|  0  0  0  0  |'
    puts '| o o |              |'
    print "----------------------\n\n"
    puts 'You will be asked to enter colours, either as a guess or for the code. This will be done as follows:'
    puts 'red orange blue green'
    puts "The name of a colour followed by a space and followed by the next colour. With a maximum of four colours per entry and no space at the end.\n\n"
    puts 'You will first be asked to enter your name where you can either enter a name or hit return if you don\'t wish to enter a name, it doesn\'t matter to the game play.'
    puts 'Next you will be asked who will be guessing, either the computer or you. This is to be entered with no space.'
    puts "You can write exit at any time to exit the game.\n\n"
    puts 'Please be aware the computer is only able to make guesses involving two repeated colours as it stands:'
    puts 'Ex: greee green purple purple'
    puts "Further functionality will be added.\n\n"
    puts "Begin the game by writing: ruby main.rb\n\n"
    puts 'I hope you enjoy!'
  end
  # rubocop: enable Layout/LineLength
  # rubocop: enable Metrics
end
