# human.rb
# frozen_string_literal: true

# Setup class Human with ability to name and make guess.
class Human
  attr_accessor :name, :human_guess

  def initialize(args_human = {})
    @name = args_human[:name]
    @human_guess = args_human[:human_guess]
  end

  def log_human_name
    print 'Enter your name: '
    @name = gets.chomp
    @name = 'Human' if @name.empty? || @name.nil?
  end

  def log_human_guess
    print 'Enter 4 colours: '
    @human_guess = gets.chomp.split(' ')
  end
end
