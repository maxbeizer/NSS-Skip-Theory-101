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

  def self.rerun_or_exit(which_part)
  	print "Would you like to try some more? Yes or No: "
  	rerun_response = gets.downcase.chomp!
  	Quiz.send(which_part) if rerun_response =~ /^y/
  end

  def self.wanna_try_more

  end

  def self.quiz_chords_options
    print "Which would you like to get quizzed on: major chords or minor chords?  "
    options_response = gets.downcase.chomp!
    if options_response =~ /^major/
      quiz_chords_major
    elsif options_response =~ /^minor/
      quiz_chords_minor
    elsif options_response =~ /(exit)|(^q)/ 
      exit
    else
      puts "I didn't quite understand that; try again please."
      quiz_chords_options
    end
  end

  def self.quiz_chords_major
    quiz_chord_start = SHARPS.sample
    generated_quiz_chord = Chords.new(quiz_chord_start + "maj").generate_chord
    print "Please enter a " + quiz_chord_start + "maj chord (case insensitive):  "
    quiz_chord_answer = gets.downcase.chomp!
    puts "You entererd: " + quiz_chord_answer
    puts "The correct answer was: " + generated_quiz_chord
    if quiz_chord_answer.upcase == generated_quiz_chord
      puts "You got it correct. You rock my socks!"
      print "want to try more? "
      try_more_response = gets.downcase.chomp!
      if try_more_response =~ /^y/
        rerun_or_exit(:quiz_chords_major)
      elsif try_more_response =~ /^n/
        Quiz.process
      elsif try_more_response =~ /\s/
        # if response is just white space then must ask again
      else
        exit
      end 
    else
      puts "You were so close!"
      print "want to try more? "
      try_more_response = gets.downcase.chomp!
      if try_more_response =~ /^y/
        rerun_or_exit(:quiz_chords_major)
      elsif try_more_response =~ /^n/
        Quiz.process
      elsif try_more_response =~ /\s/
        # if response is just white space then must ask again
      else
        exit
      end     
    end
  end

  def self.quiz_chords
    print "Enter a chord: "
    chord = gets.chomp
    chord_answer = Chords.new(chord).generate_chord
    puts chord_answer
		rerun_or_exit(:process)	
  end

  def self.quiz_scales
		print "Enter a scale: "
		scale = gets.chomp
		scale_answer = Scales.new(scale).generate_scale
		puts scale_answer
		rerun_or_exit(:process)  	
  end
  Quiz.process
end