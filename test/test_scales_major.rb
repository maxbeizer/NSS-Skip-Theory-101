require 'test/unit'
require 'scales_major'

class ScalesMajorTest < Test::Unit::TestCase
  def example_scale1
   	ScalesMajor.new("cmaj")
  end 

  def example_scale2
  	ScalesMajor.new("dmaj")
  end

  def example_scale3
  	ScalesMajor.new("dbmaj")
  end

  def example_scale4
  	ScalesMajor.new("Bmaj")
  end

  def test_01a_inherits_from_scales
    assert_equal "cmaj" , example_scale1.scale_name
  end

  def test_01b_inherits_start_posotion
    assert_equal "C" , example_scale1.scale_start_position
  end

  def test_01c_inherits_start_posotion
    assert_equal "Db" , example_scale3.scale_start_position
  end
end