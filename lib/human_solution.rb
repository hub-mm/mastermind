# human_solution.rb
# frozen_string_literal: true

# Setup HumanSolution class to return nil for solution.
class HumanSolution
  attr_accessor :human_solution

  def log_human_solution
    print 'Enter 4 colours to set the code: '
    gets.chomp.split(' ').map(&:to_sym)
  end
end
