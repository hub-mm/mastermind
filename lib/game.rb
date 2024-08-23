# game.rb
# frozen_string_literal: true

require_relative 'computer_solution'
require_relative 'human_solution'
require_relative 'solution'
require_relative 'computer'
require_relative 'human'
require_relative 'guess'
require_relative 'board'

# Setup game class to run through game.
class Game
  attr_reader :solution, :guess, :board

  def initialize
    @solution = nil
    @guess = nil
    human_name
    who_is_playing
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

  def human_name
    print 'Hey, nice to see you\'ve decided to try this game of Mastermind. What should I call you: '
    name = gets.chomp.downcase
    case name
    when nil
      'Human'
    when 'exit'
      puts 'Thank you for playing!'
      exit
    end
  end

  # rubocop: disable Metrics
  def who_is_playing
    print 'Who\'s playing? If you want to crack the code enter: \'human\', if you want to make the code: \'computer\': '
    current_player = gets.chomp.downcase
    case current_player
    when 'human'
      @solution = ComputerSolution.new.log_computer_solution
      @guess = Human.new.log_human_guess
    when 'computer'
      @solution = HumanSolution.new.log_human_solution
      @guess = Computer.new.log_computer_guess
    when 'exit'
      puts 'Thank you for checking this game out!'
      exit
    else
      puts 'Invalid input. Enter either \'human\' or \'computer\'.'
      who_is_playing
    end
  end
  # rubocop: enable Metrics

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
