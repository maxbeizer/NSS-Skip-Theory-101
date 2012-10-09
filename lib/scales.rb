require_relative 'constants'

class Scales
  attr_reader :scale_name
  
  def initialize(scale_name)
  	@scale_name = scale_name
  end

#move this to its own super class since scales and chords will need start 
#position, no?
  def start_position
 	@scale_name =~ /(\w|(\w[b#]))(m|cr)/i
 	$1.capitalize
 	#MAPPINGS($1)
  end
end #class Scales