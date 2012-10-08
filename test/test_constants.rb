require 'test/unit'
require 'constants'

class ConstantsTest < Test::Unit::TestCase
  def test_01a_sharps_constants_is_array
    ex = SHARPS
    assert_equal true , ex.is_a? Array
  end
end
