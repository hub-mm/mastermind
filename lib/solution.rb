# solution.rb
# frozen_string_literal: true

require_relative 'computer_solution'
require_relative 'human_solution'

# Setup Solution class to check which if it is receiving solution from computer or human.
class Solution
  attr_reader :computer_solution, :human_solution
  attr_writer :solution

  def initialize
    @computer = ComputerSolution.new
    @human = HumanSolution.new(human_solution)
    @computer_solution = @computer.log_computer_solution
    @human_solution = @human.log_human_solution
    @solution = solution
  end

  def solution
    if @human_solution.nil?
      puts 'Loggin computer solution'
      @computer_solution
    elsif @computer_solution.nil?
      puts 'Loggin computer solution'
      @human_solution
    end
  end
end
