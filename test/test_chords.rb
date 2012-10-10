require 'test/unit'
require 'chords'

class ChordsTest < Test::Unit::TestCase
  def example_chord1
   	Chords.new("cmaj")
  end

  def test_01_chord_name_readable
    assert_equal "cmaj" , example_chord1.chord_name
  end

  def test_01_scale_methods_accessible
    assert_equal "C" , example_chord1.chord_start_position
  end 
end