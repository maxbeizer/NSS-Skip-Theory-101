print "What would you like to learn about? Chords or Scales?  "
first_response = gets.downcase.chomp!

if first_response == "chords"
  #open chords learning file
elsif first_response == "scales"
  #opend scales learning file
else
  puts "Invalid input, stoop. Run the program again."
end
