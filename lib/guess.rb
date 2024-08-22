# guess.rb
# frozen_string_literal: true

require_relative 'computer'
require_relative 'human'

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
      @guess = @computer_guess
    elsif @computer_guess.nil?
      puts 'Logging human guess'
      @guess = @human_guess
      puts @human_guess
    end
  end
end

# Test and troubleshoot
# human = Human.new
# human.log_human_name
# human.log_human_guess
who_guessing = Guess.new
who_guessing.guess
