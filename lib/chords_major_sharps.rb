require 'chords'

class ChordsMajorSharps < Chords
  def start_index
  	SHARPS.index(chord_start_position)
  end

  def get_chord_for
    chord_array = []
    scale_for_chord = Scales.get_scale_for(chord_name)
    chord_array << scale_for_chord.major_scale_sharps[0]
    chord_array << scale_for_chord.major_scale_sharps[2]
    chord_array << scale_for_chord.major_scale_sharps[4]
  end

  def get_notes
    get_chord_for.join(" ")
  end
end