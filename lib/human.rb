# human.rb
# frozen_string_literal: true

require_relative 'gameconfig'

# Setup class Human with ability to name and make guess.
class Human
  include GameConfig

  attr_accessor :name, :human_guess

  # rubocop: disable Metrics/MethodLength
  def log_human_guess
    print 'Enter 4 colours: '
    human_guess = gets.chomp.downcase.split(' ').map(&:to_sym)

    if human_guess.length == 4 && human_guess.all? { |colour| COLOURS.include?(colour) }
      human_guess
    elsif human_guess == %i[exit]
      puts 'Thank you for playing!'
      exit
    else
      puts 'Invalid input. Try again.'
      log_human_guess
    end
  end
  # rubocop: enable Metrics/MethodLength
end
