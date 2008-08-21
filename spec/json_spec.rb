require File.dirname(__FILE__) + '/spec_helper'

describe Ofc::Chart do
  
  before :each do
    @chart = Ofc::Chart.new
  end
  
  it "should produce json when to_json is called" do
    puts "\n*********************************************************"
    puts @chart.to_json
    
    @new_chart = Ofc::Chart.new(:elements => [Ofc::Elements::Bar.new, Ofc::Elements::Line.new])
    puts @new_chart.inspect
    
    puts @new_chart.to_json
  end
  
end