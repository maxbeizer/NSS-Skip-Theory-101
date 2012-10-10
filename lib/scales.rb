require_relative 'constants'

class Scales
  attr_reader :scale_name
  
  def initialize(scale_name)
  	@scale_name = scale_name.downcase
  end

  def self.get_scale_for(scale_name)
  	# sharps and natruals use SHARPS constant, flats use FLATS
  	case scale_name
  	when /(^\w|\w[#])(min$)/
  	  ScalesMinorSharps.new(scale_name)
  	when /(^\w[b])(min$)/
  	  ScalesMinorFlats.new(scale_name)
  	when /(^\w|\w[#])(maj$)/
      ScalesMajorSharps.new(scale_name)
  	when /(^\w[b])(maj$)/
      ScalesMajorFlats.new(scale_name)
  	end
  end

  def generate_scale
  	scale = Scales.get_scale_for(scale_name)
  	scale.get_notes
  end

#move this to its own super class since scales and chords will need start 
#position, no?
  def start_position
 	@scale_name =~ /(\w|(\w[b#]))(m|cr)/
 	mappings = {
 		"c" 	=> SHARPS[0],
 		"c#"	=> SHARPS[1],
 		"db"	=> FLATS[1],
 		"d" 	=> SHARPS[2],
 		"d#"	=> SHARPS[3],
 		"eb"	=> FLATS[3],
 		"e" 	=> SHARPS[4],
 		"f" 	=> SHARPS[5],
 		"f#"	=> SHARPS[6],
 		"gb"	=> FLATS[6],
 		"g" 	=> SHARPS[7],
 		"g#"	=> SHARPS[8],
 		"ab"	=> FLATS[8],
 		"a" 	=> SHARPS[9],
 		"a#"	=> SHARPS[10],
 		"bb"	=> FLATS[10],
 		"b" 	=> SHARPS[11]
 	}
 	raise ArgumentError, "Invalid Input" if mappings[$1] == nil
 	mappings[$1]
  end
end