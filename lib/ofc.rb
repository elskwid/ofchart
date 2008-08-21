require 'rubygems'
require 'json/add/core'

require 'ofc/extensions'
require 'ofc/mixins'
require 'ofc/chart'
require 'ofc/elements'

module Ofc
  module Version
    Major = 0
    Minor = 0
    Tiny  = 1
    String = [Major, Minor, Tiny].join('.')
  end  
end