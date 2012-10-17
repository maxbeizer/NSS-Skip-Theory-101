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
    puts "You have " + @@path_array.length.inspect + " more steps to take down the path -- go on, grasshopper."
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
    puts "You have passed " + @@tests_passed.to_i.inspect + " times out of " + @@tests_attempted.to_i.inspect + " tries."
    puts "Your percentage thus far is " + passed_percentage.inspect + "%."
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
    print "Which would you like to get quizzed on? Chords or Scales?  "
    chords_or_scales = clean_gets
    print "Major or Minor?  "
    major_or_minor = clean_gets[0 , 3] #"maj" or "min"
    quiz_for(chords_or_scales, major_or_minor)
  end

  def quiz_for(chords_or_scales, major_or_minor)
    quiz_run(chords_or_scales, major_or_minor)
  end

  def rerun_or_exit
  	print "Would you like to try some more? Yes or No: "
  	rerun_response = clean_gets
  	if rerun_response =~ /^y/
      process
    else
      #exit
    end
  end

  def quiz_run(chords_or_scales, major_or_minor)
    start_note = @@path_array.sample
    index = @@path_array.index(start_note)
    if chords_or_scales =~ /^chord/
      quiz_chords(major_or_minor)
    else
      quiz_scales(major_or_minor)
    end
    user_answer = clean_gets
    puts "You entererd: " + user_answer
    puts "The correct answer was: " + @generated_answer
    if user_answer.downcase.strip == @generated_answer.downcase
      puts "You got it correct. " + CONGRATS.sample
      generate_pass
      move_down_the_path(index)
      display_path_progress
      rerun_or_exit
    else
      puts "You were so close! " + ENCOURAGEMENT.sample
      generate_fail
      display_path_progress
      rerun_or_exit
    end
  end

  def quiz_chords(major_or_minor)
    quiz_chord_start = @@path_array.sample
    @generated_answer = Chords.new(quiz_chord_start + major_or_minor).generate_chord
    print "Please enter a " + quiz_chord_start + major_or_minor + " chord (case insensitive):  "
  end

  def quiz_scales(major_or_minor)
    quiz_scale_start = @@path_array.sample
    @generated_answer = Scales.new(quiz_scale_start + major_or_minor).generate_scale
    print "Please enter a " + quiz_scale_start + major_or_minor + " scale (case insensitive):  "
  end

  Quiz.new().process
end
