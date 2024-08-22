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

  def initialize(args = nil)
    @solution = args[:solution]
    @guess = args[:guess]
    @board = args[:board]

    @guess_cells = [0, 0, 0, 0]
    @solution_cells = %w[o o o o]

    @colours = COLOURS
    @solution_colours = SOLUTION_COLOURS
  end

  def update_guess_cells
    @guess_cells[0] = Rainbow('0').send(@guess[0])
    @guess_cells[1] = Rainbow('0').send(@guess[1])
    @guess_cells[2] = Rainbow('0').send(@guess[2])
    @guess_cells[3] = Rainbow('0').send(@guess[3])
  end

  def check_guess
    full_match = 0
    partial_match = 0

    @guess.each_with_index do |colour, index|
      if colour == @solution[index]
        full_match += 1
      elsif @solution.include?(colour)
        partial_match += 1
      end
    end

    [full_match, partial_match]
  end

  # rubocop: disable Metrics/MethodLength
  def update_solution_cell(check_guess)
    counter_full = check_guess[0].to_i
    counter_partial = check_guess[1].to_i

    @solution_cells.each_with_index do |cell, index|
      if counter_full.positive?
        @solution_cells[index] = Rainbow(cell).green
        counter_full -= 1
      elsif counter_partial.positive?
        @solution_cells[index] = Rainbow(cell).orange
        counter_partial -= 1
      end
    end
  end
  # rubocop: enable Metrics/MethodLength

  def board
    puts '--------------'
    puts "|#{@solution_cells[0]}#{@solution_cells[1]}|         |"
    puts "|--| #{@guess_cells[0]} #{@guess_cells[1]} #{@guess_cells[2]} #{@guess_cells[3]} |"
    puts "|#{@solution_cells[2]}#{@solution_cells[3]}|         |"
    print '--------------'
  end
end

show = Board.new(solution: %w[red red blue red], guess: %w[red red blue red])

# Test and troubleshoot
show.update_guess_cells
matches = show.check_guess
show.update_solution_cell(matches)
puts show.board
