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
    	learning_scales
    else
      puts "Invalid input, stoop. Run the program again."
    end
  end

  def self.rerun_or_exit
  	print "Would you like to try some more? Yes or No: "
  	rerun_response = gets.downcase.chomp!
  	Learning.process if rerun_response == "yes"
  end

  def self.learning_chords
    print "Enter a chord: "
    chord = gets.chomp
    chord_answer = Chords.new(chord).generate_chord
    puts chord_answer
		rerun_or_exit	
  end

  def self.learning_scales
		print "Enter a scale: "
		scale = gets.chomp
		scale_answer = Scales.new(scale).generate_scale
		puts scale_answer
		rerun_or_exit  	
  end
  Learning.process
end