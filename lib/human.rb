# human.rb
# frozen_string_literal: true

# Setup human with ability to name and make guess.
class Human
  attr_accessor :name, :guess_human

  def initialize(args_human = nil)
    @name = args_human[:name]
    @human_guess = args_human[:human_guess]
  end

  def log_human_name
    print 'Enter your name: '
    @name = gets.chomp
    @name = 'Player' if @name.empty? || @name.nil?
  end

  def log_human_guess
    print 'Enter 4 colours: '
    @human_guess = gets.chomp.split(' ')
  end
end

# Test and troubleshoot
# name = Human.new(name: 'Human')
# name.log_human_name
# guess = name.log_human_guess
# puts guess.is_a?(Array)
test = Human.new(human_guess: %w[red orange red blue])
test.log_human_name
p test
