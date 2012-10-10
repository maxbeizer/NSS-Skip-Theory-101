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

  def self.get_chord_for(chord_name)
    # sharps and natruals use SHARPS constant, flats use FLATS
    case chord_name
    when /(^\w|\w[#])(min$)/
      ChordsMinorSharps.new(chord_name)
    when /(^\w[b])(min$)/
      ChordsMinorFlats.new(chord_name)
    when /(^\w|\w[#])(maj$)/
      ChordsMajorSharps.new(chord_name)
    when /(^\w[b])(maj$)/
      ChordsMajorFlats.new(chord_name)
    end
  end

  def generate_chord
    chord = Chords.get_chord_for(chord_name)
    chord.get_notes
  end
end