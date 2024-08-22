# guess.rb
# frozen_string_literal: true

require_relative 'computer'
require_relative 'human'

# Setup Guess class to check if it is receiving a guess from Human or Computer.
class Guess
  attr_reader :computer_guess, :human_guess
  attr_writer :guess

  def initialize
    @human = Human.new
    @computer = Computer.new
    @human_guess = @human.log_human_guess
    @computer_guess = @computer.log_computer_guess
    @guess = guess
  end

  def guess
    if @human_guess.nil?
      puts 'Logging computer guess'
      @computer_guess
    elsif @computer_guess.nil?
      puts 'Logging human guess'
      @human_guess
    end
  end
end

new_guess = Guess.new
puts new_guess.guess
