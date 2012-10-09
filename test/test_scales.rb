require 'test/unit'
require 'scales'

class ScalesTest < Test::Unit::TestCase
  def test_01_scale_name_readable
    example_scale = Scales.new("cmaj")
    assert_equal "cmaj" , example_scale.scale_name
  end
end