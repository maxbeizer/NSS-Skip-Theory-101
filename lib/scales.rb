require_relative 'constants'

class Scales
  attr_reader :scale_name
  
  def initialize(scale_name)
  	@scale_name = scale_name
  end
end