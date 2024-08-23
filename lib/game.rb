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

  # rubocop: disable Metrics
  def play
    round = 0
    12.times do
      round += 1
      @board.update_guess_cells
      matches = @board.check_guess
      @board.update_solution_cell(matches)
      display_board

      break if game_over?(matches)

      puts "Round #{round}/12"
      @guess = Guess.new.guess
      @board = Board.new(solution: @solution, guess: @guess)

      puts 'Code not cracked in twelve rounds.' if round == 12
    end
  end
  # rubocop: enable Metrics

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
