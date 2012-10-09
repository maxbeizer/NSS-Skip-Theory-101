require 'test/unit'
require 'scales_major'

class Scales_MajorTest < Test::Unit::TestCase
  def example_scale
  	ScalesMajor.new("cmaj")
  end

  def test_01_inherits_from_scales
    assert_equal "cmaj" , example_scale.scale_name
  end

end