require_relative 'constants'

class Scales
  attr_reader :scale_name
  
  def initialize(scale_name)
  	@scale_name = scale_name
  end

#move this to its own super class since scales and chords will need start 
#position, no?
  def start_position
  	case @scale_name
  	when /^c[mc]/i
  	  SHARPS[0]
	when /^c#[mc]/i
  	  SHARPS[1]
   	when /^db[mc]/i
  	  FLATS[1]
  	when /^d[mc]/i
  	  SHARPS[2]
  	when /^d#[mc]/i
  	  SHARPS[3]
   	when /^eb[mc]/i
  	  FLATS[3]  	
  	when /^e[mc]/i
  	  SHARPS[4]
  	when /^f[mc]/i
  	  SHARPS[5]  	
  	when /^f#[mc]/i
  	  SHARPS[6]
   	when /^gb[mc]/i
  	  FLATS[6]
  	when /^g[mc]/i
  	  SHARPS[7]  	
  	when /^g#[mc]/i
  	  SHARPS[8]
   	when /^ab[mc]/i
  	  FLATS[8]  
  	when /^a[mc]/i
  	  SHARPS[9]  	
  	when /^a#[mc]/i
  	  SHARPS[10]
   	when /^bb[mc]/i
  	  FLATS[10]  
  	when /^b[mc]/i
  	  SHARPS[11]
  	else
  	  raise ArgumentError, "invalid chord name" 
  	end
  end
end #class Scales