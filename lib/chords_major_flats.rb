require 'chords'

class ChordsMajorFlats < Chords
  def start_index
  	Flats.index(chord_start_position)
  end

  def get_chord_for
    chord_array = []
    scale_for_chord = Scales.get_scale_for(chord_name)
    chord_array << scale_for_chord.major_scale_flats[0]
    chord_array << scale_for_chord.major_scale_flats[2]
    chord_array << scale_for_chord.major_scale_flats[4]
  end

  def get_notes
    get_chord_for.join(" ")
  end
end