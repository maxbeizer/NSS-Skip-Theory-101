require 'test/unit'
require 'chords_major_sharps'

class ChordsMajorSharpsTest < Test::Unit::TestCase
  def example_chord1
   	ChordsMajorSharps.new("cmaj")
  end 

  def example_chord2
  	ChordsMajorSharps.new("dmaj")
  end

  def example_chord3
  	ChordsMajorSharps.new("d#maj")
  end

  def example_chord4
    ChordsMajorSharps.new("A#maj")
  end
  
  def example_chord5
    ChordsMajorSharps.new("g#maj")
  end

  def example_chord6
    ChordsMajorSharps.new("f#maj")
  end


  def test_03a_get_chord_for
    assert_equal ["C", "E", "G"] , example_chord1.get_chord_for
  end

  def test_03b_get_chord_for
    assert_equal ["D", "F#", "A"] , example_chord2.get_chord_for
  end

  def test_03c_get_chord_for
    assert_equal ["D#", "G", "A#"] , example_chord3.get_chord_for
  end

  def test_03d_get_chord_for
    assert_equal ["A#", "D", "F"] , example_chord4.get_chord_for
  end

  def test_03e_get_chord_for
    assert_equal ["G#", "C", "D#"] , example_chord5.get_chord_for
  end

  def test_03f_get_chord_for
    assert_equal ["F#", "A#", "C#"] , example_chord6.get_chord_for
  end

  def test_04_get_notes
    assert_equal "F# A# C#" , example_chord6.get_notes
  end  
end