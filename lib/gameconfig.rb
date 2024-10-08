# gameconfig.rb
# frozen_string_literal: true

require 'rainbow/refinement'
using Rainbow

module GameConfig
  COLOURS = %i[red blue green orange purple pink].freeze
  SOLUTION_COLOURS = %i[green orange].freeze
end
