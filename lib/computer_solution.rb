# computer_solution.rb
# frozen_string_literal: true

require_relative 'gameconfig'

# Setup ComputerSolution class to output random variation of 4 colours, allowing repeated colours.
class ComputerSolution
  include GameConfig

  attr_writer :computer_solution

  def log_computer_solution
    4.times.map { COLOURS.sample }
  end
end
