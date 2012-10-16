require_relative "scales_major_sharps"
require_relative "scales_minor_sharps"
require_relative "scales_major_flats"
require_relative "scales_minor_flats"
require_relative "chords_major_sharps"
require_relative "chords_minor_sharps"
require_relative "chords_major_flats"
require_relative "chords_minor_flats"

ALL_NOTES = SHARPS + FLATS

class Quiz
  @@tests_attempted = 0.0
  @@tests_passed = 0.0

  def self.increment_tests_attempted
    @@tests_attempted += 1
  end

  def self.increment_tests_passed
    @@tests_passed += 1    
  end

  def self.passed_percentage
    (@@tests_passed / @@tests_attempted) * 100
  end

  def self.print_progress
    puts "You have passed " + @@tests_passed.to_i.to_s + " times out of " + @@tests_attempted.to_i.to_s + " tries"
    puts "Your percentage thus far is " + passed_percentage.to_s + "%."
  end

  def self.clean_gets
    gets.downcase.chomp
  end

  def self.process
    print "What would you like to get quizzed on? Chords or Scales?  "
    first_response = clean_gets
    if first_response =~ /^chord/
      quiz_chords_options
    elsif first_response =~ /^scale/
      quiz_scales_options
    elsif first_response =~ /(exit)|(^q)/ 
      #exit the program
    else
      puts "I didn't quite understand that; try again please."
      process
    end
  end

  def self.rerun_or_exit(which_part)
  	print "Would you like to try some more? Yes or No: "
  	rerun_response = clean_gets
  	if rerun_response =~ /^y/
      #stay here or return to mmain quiz menu
      print "Would you like to stay here or return to quiz menu?  "
      stay_or_return_response = clean_gets
      if stay_or_return_response =~ /(stay)|(here)/  
        Quiz.send(which_part)
      elsif stay_or_return_response =~ /(exit)|(^q)/ 
      #exit the program
      else
        process
      end 
    else
      #exit
    end  
  end

  def self.quiz_chords_options
    print "Which would you like to get quizzed on: major chords or minor chords?  "
    options_response = clean_gets
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
    quiz_chord_start = ALL_NOTES.sample
    generated_quiz_chord = Chords.new(quiz_chord_start + "maj").generate_chord
    print "Please enter a " + quiz_chord_start + "maj chord (case insensitive):  "
    quiz_chord_answer = clean_gets
    puts "You entererd: " + quiz_chord_answer
    puts "The correct answer was: " + generated_quiz_chord
    if quiz_chord_answer.downcase == generated_quiz_chord.downcase
      puts "You got it correct. You rock my socks!"
      increment_tests_passed
      increment_tests_attempted
      print_progress
      rerun_or_exit(:quiz_chords_options) 
    else
      puts "You were so close!"
      increment_tests_attempted
      print_progress
      rerun_or_exit(:quiz_chords_options)      
    end
  end

  def self.quiz_chords_minor
    quiz_chord_start = ALL_NOTES.sample
    generated_quiz_chord = Chords.new(quiz_chord_start + "min").generate_chord
    print "Please enter a " + quiz_chord_start + "min chord (case insensitive):  "
    quiz_chord_answer = clean_gets
    puts "You entererd: " + quiz_chord_answer
    puts "The correct answer was: " + generated_quiz_chord
    if quiz_chord_answer.downcase == generated_quiz_chord.downcase
      puts "You got it correct. You rock my socks!"
      increment_tests_passed
      increment_tests_attempted
      print_progress
      rerun_or_exit(:quiz_chords_options)  
    else
      puts "You were so close!"
      increment_tests_attempted
      print_progress
      rerun_or_exit(:quiz_chords_options)      
    end
  end

  def self.quiz_scales_options
    print "Which would you like to get quizzed on: major scales or minor scales?  "
    options_response = clean_gets
    if options_response =~ /^major/
      quiz_scales_major
    elsif options_response =~ /^minor/
      quiz_scales_minor
    elsif options_response =~ /(exit)|(^q)/ 
      exit
    else
      puts "I didn't quite understand that; try again please."
      quiz_scales_options
    end  	
  end

  def self.quiz_scales_major
    quiz_scale_start = ALL_NOTES.sample
    generated_quiz_scale = Scales.new(quiz_scale_start + "maj").generate_scale
    print "Please enter a " + quiz_scale_start + "maj scale (case insensitive):  "
    quiz_scale_answer = clean_gets
    puts "You entererd: " + quiz_scale_answer
    puts "The correct answer was: " + generated_quiz_scale
    if quiz_scale_answer.downcase == generated_quiz_scale.downcase
      puts "You got it correct. You rock my socks!"
      increment_tests_passed
      increment_tests_attempted
      print_progress
      rerun_or_exit(:quiz_scales_options) 
    else
      puts "You were so close!"
      increment_tests_attempted
      print_progress
      rerun_or_exit(:quiz_scales_options)     
    end
  end

  def self.quiz_scales_minor
    quiz_scale_start = ALL_NOTES.sample
    generated_quiz_scale = Scales.new(quiz_scale_start + "min").generate_scale
    print "Please enter a " + quiz_scale_start + "min scale (case insensitive):  "
    quiz_scale_answer = clean_gets
    puts "You entererd: " + quiz_scale_answer
    puts "The correct answer was: " + generated_quiz_scale
    if quiz_scale_answer.downcase == generated_quiz_scale.downcase
      puts "You got it correct. You rock my socks!"
      increment_tests_passed
      increment_tests_attempted
      print_progress
      rerun_or_exit(:quiz_scales_options) 
    else
      puts "You were so close!"
      increment_tests_attempted
      print_progress
      rerun_or_exit(:quiz_scales_options)     
    end
  end
  Quiz.process
end
