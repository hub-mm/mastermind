# computer.rb
# frozen_string_literal: true

require_relative 'gameconfig'
require_relative 'solution'
require_relative 'guess'
require_relative 'board'

# Setup Computer class to output nil for guess.
class Computer
  include GameConfig

  attr_writer :computer_guess
  attr_reader :solution, :board

  def initialize
    @solution = Solution.new.solution
    @computer_guess = log_computer_guess
    @board = Board.new(solution: @solution, guess: @computer_guess)
  end

  def log_computer_guess
    random_colour = COLOURS.sample(2)
    @computer_guess = [random_colour[0], random_colour[0], random_colour[1], random_colour[1]]
  end
end
