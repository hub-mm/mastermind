# computer.rb
# frozen_string_literal: true

# Setup Computer class to output nil for guess.
class Computer
  attr_writer :computer_guess

  def log_computer_guess
    colours = %w[red blue green orange purple yellow]
    match = 0
    random_colour = colours.sample(2)
    computer_guess = [random_colour[0], random_colour[0], random_colour[1], random_colour[1]]
  end
end

arr = Computer.new
p arr.log_computer_guess
