require File.dirname(__FILE__) + '/spec_helper'

describe Ofchart::Chart do
  
  before :each do
    @chart = Ofchart::Chart.new
  end
  
  it "should have a few of the basic attributes" do
    [:width, :title, :type, :width, :height].each do |attr|
      @chart.should respond_to(attr)
    end
  end  

  
end

