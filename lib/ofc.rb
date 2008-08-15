require 'ofc/extensions'
require 'ofc/chart'
require 'ofc/elements'

module Ofc
  # nothing to see here
  module Version
    Major = 0
    Minor = 0
    Tiny  = 1
    
    String = [Major, Minor, Tiny].join('.')
  end  
end