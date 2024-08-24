# solution.rb
# frozen_string_literal: true

require_relative 'computer_solution'
require_relative 'human_solution'

# Setup Solution class to check which if it is receiving solution from computer or human.
class Solution
  attr_reader :computer_solution, :human_solution
  attr_writer :solution

  # def initialize
  #   @computer_solution = ComputerSolution.new.log_computer_solution
  #   @human_solution = HumanSolution.new.log_human_solution
  # end

  def solution
    if @human_solution.nil?
      @computer_solution
    elsif @computer_solution.nil?
      @human_solution
    end
  end
end
