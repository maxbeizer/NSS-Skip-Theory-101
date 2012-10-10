require 'test/unit'
require 'chords'

class ChordsTest < Test::Unit::TestCase
  def example_chord1
   	Chords.new("cmaj")
  end 

  def example_chord2
  	Chords.new("dmaj")
  end

  def example_chord3
  	Chords.new("dbmaj")
  end

  def example_chord4
    Chords.new("bbmaj")
  end
  
  def example_chord5
    Chords.new("bbmin")
  end

  def example_chord6
    Chords.new("f#min")
  end

  def test_01_chord_name_readable
    assert_equal "cmaj" , example_chord1.chord_name
  end

  def test_02a_scale_methods_accessible
    assert_equal "C" , example_chord1.chord_start_position
  end

  def test_02b_scale_methods_accessible
    assert_equal "Db" , example_chord3.chord_start_position
  end

  def test_02c_scale_methods_accessible
    assert_equal "F#" , example_chord6.chord_start_position
  end

  def test_03a_generate_chord1
    assert_equal "C E G" , example_chord1.generate_chord
  end
end