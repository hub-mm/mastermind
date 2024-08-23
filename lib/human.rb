# human.rb
# frozen_string_literal: true

# Setup class Human with ability to name and make guess.
class Human
  attr_accessor :name, :human_guess

  def log_human_guess
    print 'Enter 4 colours: '
    @human_guess = gets.chomp.split(' ')
  end
end
