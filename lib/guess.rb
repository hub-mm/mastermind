# guess.rb
# frozen_string_literal: true

require_relative 'computer'
require_relative 'human'

# Setup Guess class to check if it is receiving a guess from Human or Computer.
class Guess
  attr_reader :computer_guess, :human_guess
  attr_writer :guess

  def initialize
    @computer_guess = Computer.new.log_computer_guess
    @human_guess = Human.new.log_human_guess
  end

  def guess
    if @human_guess.nil?
      @computer_guess
    elsif @computer_guess.nil?
      @human_guess
    end
  end
end
