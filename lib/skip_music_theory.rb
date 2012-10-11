require_relative "scales_major_sharps"
require_relative "scales_minor_sharps"
require_relative "scales_major_flats"
require_relative "scales_minor_flats"
require_relative "chords_major_sharps"
require_relative "chords_minor_sharps"
require_relative "chords_major_flats"
require_relative "chords_minor_flats"

print "Enter a scale: "
scale = gets.chomp

scale_answer = Scales.new(scale).generate_scale

puts scale_answer

print "Enter a chord: "
chord = gets.chomp

chord_answer = Chords.new(chord).generate_chord

puts chord_answer