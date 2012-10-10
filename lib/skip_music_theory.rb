require_relative "chords"
require_relative "chords_major_sharps"

print "Enter a major chord: "
entry = gets.chomp

answer = Chords.new(entry).generate_chord

puts answer