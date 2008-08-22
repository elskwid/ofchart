require 'rubygems'
require 'ofc' # we need this, can't build the ofcharts without it ;-)

require 'ofchart/theme'
require 'ofchart/chart'

module Ofchart
  module Version
    Major = 0
    Minor = 0
    Tiny  = 1
    
    String = [Major, Minor, Tiny].join('.')
  end
end