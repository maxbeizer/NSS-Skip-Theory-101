require 'test/unit'
require 'scales_minor'

class ScalesMinorTest < Test::Unit::TestCase
  def example_scale1
    ScalesMinor.new("cmin")
  end 

  def example_scale2
    ScalesMinor.new("dmin")
  end

  def example_scale3
    ScalesMinor.new("dbmin")
  end

  def example_scale4
    ScalesMinor.new("Bmin")
  end

  def test_01a_inherits_from_scales
    assert_equal "cmin" , example_scale1.scale_name
  end

  def test_01b_inherits_start_posotion
    assert_equal "C" , example_scale1.scale_start_position
  end

  def test_01c_inherits_start_posotion
    assert_equal "Db" , example_scale3.scale_start_position
  end
end