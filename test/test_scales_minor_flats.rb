require 'test/unit'
require 'scales_minor_flats'

class ScalesMinorFlatsTest < Test::Unit::TestCase
  def example_scale1
    ScalesMinorFlats.new("amin")
  end 

  def example_scale2
    ScalesMinorFlats.new("dbmin")
  end

  def example_scale3
    ScalesMinorFlats.new("gbbmin")
  end

  def example_scale4
    ScalesMinorFlats.new("Bbmin")
  end

  def test_01a_build_minor_scale_flats_from_start_position
    assert_equal "Db" , example_scale2.build_minor_scale_flats[0]
  end

  def test_01b_build_minor_scale_flats
    assert_equal ["A", "B", "C", "D", "E", "F", "G"] , example_scale1.build_minor_scale_flats
  end

  def test_01c_build_minor_scale_flats2
    assert_equal ["Db", "Eb", "E", "Gb", "Ab", "A", "B"] , example_scale2.build_minor_scale_flats
  end

  def test_01d_build_minor_scale_flats3
    assert_equal ["Bb", "C", "Db", "Eb", "F", "Gb", "Ab"] , example_scale4.build_minor_scale_flats
  end

  def test_02_start_position_index
    assert_equal 9 , example_scale1.start_index
    assert_equal 1 , example_scale2.start_index
  end
end