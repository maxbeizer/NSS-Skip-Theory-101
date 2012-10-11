require_relative "scales_major_sharps"
require_relative "scales_minor_sharps"
require_relative "scales_major_flats"
require_relative "scales_minor_flats"
require_relative "chords_major_sharps"
require_relative "chords_minor_sharps"
require_relative "chords_major_flats"
require_relative "chords_minor_flats"

class Quiz
  def self.process
    print "What would you like to get quizzed on? Chords or Scales?  "
    first_response = gets.downcase.chomp!
    if first_response =~ /^chord/
      quiz_chords_options
    elsif first_response =~ /^scale/
      quiz_scales
    elsif first_response =~ /(exit)|(^q)/ 
      #exit the program
    else
      puts "I didn't quite understand that; try again please."
      process
    end
  end

  def self.rerun_or_exit
  	print "Would you like to try some more? Yes or No: "
  	rerun_response = gets.downcase.chomp!
  	Quiz.process if rerun_response =~ /^y/
  end

  def self.quiz_chords_options
    print "Which would you like to get quizzed on: major chords or minor chords?  "
    options_response = gets.downcase.chomp!
    if options_response =~ /^major/
      quiz_chords_major
    elsif options_response =~ /^minor/
      quiz_chords_minor
    elsif options_response =~ /(exit)|(^q)/ 
      #exit the program
    else
      puts "I didn't quite understand that; try again please."
      quiz_chords_options
    end
  end

  def self.quiz_chords_major
    
  end

  def self.quiz_chords
    print "Enter a chord: "
    chord = gets.chomp
    chord_answer = Chords.new(chord).generate_chord
    puts chord_answer
		rerun_or_exit	
  end

  def self.quiz_scales
		print "Enter a scale: "
		scale = gets.chomp
		scale_answer = Scales.new(scale).generate_scale
		puts scale_answer
		rerun_or_exit  	
  end
  Quiz.process
end