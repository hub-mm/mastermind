# board.rb
# frozen_string_literal: true

require_relative 'gameconfig'
require_relative 'solution'
require_relative 'guess'

# Setup board
class Board
  include GameConfig

  attr_reader :solution, :guess
  attr_writer :board

  def initialize(args_board = nil)
    @solution = args_board[:solution]
    @guess = args_board[:guess]
    @board = args_board[:board]

    @guess_cells = [0, 0, 0, 0]
    @solution_cells = %w[o o o o]

    @colours = COLOURS
    @solution_colours = SOLUTION_COLOURS
  end

  def update_guess_cells
    @guess_cells.each_index do |index|
      @guess_cells[index] = Rainbow('0').color(@guess[index].to_sym)
    end
  end

  # rubocop: disable Metrics/MethodLength
  def check_guess
    full_match = 0
    partial_match = 0
    used_match = []

    puts "solution: #{@solution}"

    @guess.each_with_index do |colour, index|
      if colour.to_sym == @solution[index]
        full_match += 1
        used_match << index
      elsif @solution.include?(colour.to_sym) && !used_match.include?(@solution.index(colour.to_sym))
        partial_match += 1
        used_match << @solution.index(colour.to_sym)
      end
    end

    [full_match, partial_match]
  end
  # rubocop: enable Metrics/MethodLength

  # rubocop: disable Metrics/MethodLength
  def update_solution_cell(check_guess)
    counter_full = check_guess[0].to_i
    counter_partial = check_guess[1].to_i

    @solution_cells.each_index do |index|
      if counter_full.positive?
        @solution_cells[index] = Rainbow('o').green
        counter_full -= 1
      elsif counter_partial.positive?
        @solution_cells[index] = Rainbow('o').orange
        counter_partial -= 1
      end
    end
  end
  # rubocop: enable Metrics/MethodLength

  def board
    puts '----------------------'
    puts "| #{@solution_cells[0]} #{@solution_cells[1]} |              |"
    puts "|-+-+-|  #{@guess_cells[0]}  #{@guess_cells[1]}  #{@guess_cells[2]}  #{@guess_cells[3]}  |"
    puts "| #{@solution_cells[2]} #{@solution_cells[3]} |              |"
    print "----------------------\n"
  end
end

show = Board.new(solution: Solution.new.solution, guess: Guess.new.guess)
show.update_guess_cells
matches = show.check_guess
show.update_solution_cell(matches)
show.board
