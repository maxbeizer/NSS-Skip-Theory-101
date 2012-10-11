require_relative "scales"
require_relative "scales_major_sharps"

print "Enter a major scale: "
entry = gets.chomp

answer = Scales.new(entry).generate_scale

puts answer