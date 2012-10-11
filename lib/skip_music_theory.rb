require_relative "scales_major_sharps"
require_relative "scales_minor_sharps"
require_relative "scales_major_flats"
require_relative "scales_minor_flats"
require_relative "chords_major_sharps"
require_relative "chords_minor_sharps"
require_relative "chords_major_flats"
require_relative "chords_minor_flats"

class Learning
  def self.process
    print "What would you like to learn about? Chords or Scales?  "
    first_response = gets.downcase.chomp!

    if first_response == "chords"
      learning_chords
    elsif first_response == "scales"
      #opend scales learning file
    else
      puts "Invalid input, stoop. Run the program again."
    end
  end

  def self.learning_chords
    print "Enter a chord: "
    chord = gets.chomp
    chord_answer = Chords.new(chord).generate_chord
    puts chord_answer	
  end
  Learning.process
end