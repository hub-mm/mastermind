# computer.rb
# frozen_string_literal: true

class Computer
  attr_writer :computer_guess

  def initialize(computer_args = {})
    @computer_guess = computer_args[:computer_guess]
  end

  def log_computer_guess
    nil
  end
end
