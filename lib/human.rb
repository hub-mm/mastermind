# human.rb
# frozen_string_literal: true

class Human
  attr_accessor :name, :guess_human

  def initialize(args_human = nil)
    @name = args_human[:name]
    @human_guess = args_human[:human_guess]
  end

  def human_name
    print 'Enter your name: '
    @name = gets.chomp
  end
end

# Test and troubleshoot
name = Human.new(name: 'Human')
name.human_name
