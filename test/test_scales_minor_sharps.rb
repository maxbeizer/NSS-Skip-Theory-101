require 'test/unit'
require 'scales_minor_sharps'

class ScalesMinorsharpsTest < Test::Unit::TestCase
  def example_scale1
    ScalesMinorSharps.new("amin")
  end 

  def example_scale2
    ScalesMinorSharps.new("d#min")
  end

  def example_scale3
    ScalesMinorSharps.new("g#bmin")
  end

  def example_scale4
    ScalesMinorSharps.new("a#bmin")
  end

  def test_01a_build_minor_scale_sharps_from_start_position
    assert_equal "D#" , example_scale2.build_minor_scale_sharps[0]
  end

  def test_01b_build_minor_scale_sharps
    assert_equal ["A", "B", "C", "D", "E", "F", "G"] , example_scale1.build_minor_scale_sharps
  end

  def test_01c_build_minor_scale_sharps2
    assert_equal ["D#", "F", "F#", "G#", "A#", "B", "C#"] , example_scale2.build_minor_scale_sharps
  end

  def test_01d_build_minor_scale_sharps3
    assert_equal ["B", "C#", "D", "E", "F#", "G", "A"] , example_scale4.build_minor_scale_sharps
  end

  def test_02_start_position_index
    assert_equal 9 , example_scale1.start_index
    assert_equal 3 , example_scale2.start_index
  end
end