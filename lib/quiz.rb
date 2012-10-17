require_relative "scales_major_sharps"
require_relative "scales_minor_sharps"
require_relative "scales_major_flats"
require_relative "scales_minor_flats"
require_relative "chords_major_sharps"
require_relative "chords_minor_sharps"
require_relative "chords_major_flats"
require_relative "chords_minor_flats"

class Quiz
  @@path_array = SHARPS + FLATS
  @@tests_attempted = 0.0
  @@tests_passed = 0.0

  def move_down_the_path(index)
    @@path_array.slice!(index)
  end

  def display_path_progress
    puts "You have " + @@path_array.length.to_s + " more steps to take down the path"
  end

  def increment_tests_attempted
    @@tests_attempted += 1
  end

  def increment_tests_passed
    @@tests_passed += 1    
  end

  def passed_percentage
    (@@tests_passed / @@tests_attempted) * 100
  end

  def print_progress
    puts "You have passed " + @@tests_passed.to_i.to_s + " times out of " + @@tests_attempted.to_i.to_s + " tries"
    puts "Your percentage thus far is " + passed_percentage.to_s + "%."
  end

  def generate_pass
    increment_tests_passed
    increment_tests_attempted
    print_progress
  end

  def generate_fail
    increment_tests_attempted
    print_progress
  end

  def clean_gets
    gets.downcase.chomp
  end

  def process
    print "What would you like to get quizzed on? Chords or Scales?  "
    chords_or_scales = clean_gets
    print "Major or Minor?  "
    major_or_minor = clean_gets[0 , 3] #"maj" or "min"
    quiz_for(chords_or_scales, major_or_minor)
  end

  def quiz_for(chords_or_scales, major_or_minor)
    if chords_or_scales =~ /^chord/
      quiz_chords(major_or_minor)
    else
      quiz_scales(major_or_minor)
    end
  end

  def rerun_or_exit(which_part)
  	print "Would you like to try some more? Yes or No: "
  	rerun_response = clean_gets
  	if rerun_response =~ /^y/
      #stay here or return to mmain quiz menu
      print "Would you like to stay here or return to quiz menu?  "
      stay_or_return_response = clean_gets
      if stay_or_return_response =~ /(stay)|(here)/  
        self.send(which_part)
      elsif stay_or_return_response =~ /(exit)|(^q)/ 
      #exit the program
      else
        process
      end 
    else
      #exit
    end  
  end

  def quiz_chords(type)
    quiz_chord_start = @@path_array.sample
    index = @@path_array.index(quiz_chord_start)
    generated_quiz_chord = Chords.new(quiz_chord_start + type).generate_chord
    print "Please enter a " + quiz_chord_start + type + " chord (case insensitive):  "
    quiz_chord_answer = clean_gets
    puts "You entererd: " + quiz_chord_answer
    puts "The correct answer was: " + generated_quiz_chord
    if quiz_chord_answer.downcase == generated_quiz_chord.downcase
      puts "You got it correct. You rock my socks!"
      generate_pass
      move_down_the_path(index)
      display_path_progress
      rerun_or_exit(:quiz_chords_options) 
    else
      puts "You were so close!"
      generate_fail
      display_path_progress
      rerun_or_exit(:quiz_chords_options)      
    end
  end

  def quiz_scales(type)
    quiz_scale_start = @@path_array.sample
    index = @@path_array.index(quiz_scale_start)
    generated_quiz_scale = Scales.new(quiz_scale_start + type).generate_scale
    print "Please enter a " + quiz_scale_start + type + " scale (case insensitive):  "
    quiz_scale_answer = clean_gets
    puts "You entererd: " + quiz_scale_answer
    puts "The correct answer was: " + generated_quiz_scale
    if quiz_scale_answer.downcase == generated_quiz_scale.downcase
      puts "You got it correct. You rock my socks!"
      generate_pass
      move_down_the_path(index)
      display_path_progress
      rerun_or_exit(:quiz_scales_options) 
    else
      puts "You were so close!"
      generate_fail
      display_path_progress
      rerun_or_exit(:quiz_scales_options)     
    end
  end

  Quiz.new().process
end
