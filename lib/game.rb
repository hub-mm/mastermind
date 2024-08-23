# game.rb
# frozen_string_literal: true

require_relative 'solution'
require_relative 'guess'
require_relative 'board'

# Setup game class to run through game.
class Game
  attr_reader :solution, :guess, :board

  def initialize
    @solution = Solution.new.solution
    @guess = Guess.new.guess
    @board = Board.new(solution: @solution, guess: @guess)
  end

  def play
    12.times do
      display_board
      @board.update_guess_cells
      matches = @board.check_guess
      @board.update_solution_cell(matches)
      display_board

      break if game_over?(matches)

      @guess = Guess.new.guess
      @board = Board.new(solution: @solution, guess: @guess)
    end
  end

  private

  def display_board
    @board.board
  end

  def game_over?(matches)
    if matches[0] == 4
      puts 'Code cracked!'
      true
    else
      false
    end
  end
end

game = Game.new
game.play
