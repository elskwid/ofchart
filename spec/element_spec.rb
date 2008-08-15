require File.dirname(__FILE__) + '/spec_helper'

# Tests for the 'contract' of the elements
describe Ofc::Elements::Base do
  
  it "should have a base element type with the default fields (not values)" do
    b = Ofc::Elements::Base.new
    b.should respond_to(:values)
    b.values.should be_empty
  end

  
end