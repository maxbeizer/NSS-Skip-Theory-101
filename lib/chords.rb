require_relative 'constants'
require_relative 'scales'

class Chords
  attr_reader :chord_name
  
  def initialize(chord_name)
  	@chord_name = chord_name.downcase
  end

  def chord_start_position
    Scales.new(chord_name).scale_start_position
  end

end