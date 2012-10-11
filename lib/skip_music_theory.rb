require_relative "scales"
require_relative "scales_major_sharps"
require_relative "scales_minor_sharps"

print "Enter a major scale: "
entry = gets.chomp

answer = Scales.new(entry).generate_scale

puts answer