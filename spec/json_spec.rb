require File.dirname(__FILE__) + '/spec_helper'

describe Ofc::Chart do
  
  before :each do
    @chart = Ofc::Chart.new
  end
  
  it "should produce json when to_json is called" do
    # puts @chart.to_json
    # puts @chart.to_json.inspect
    puts @chart.title.text = "hi"
    puts @chart.title
    
    @chart2 = Ofc::Chart.new
    puts "CHART 2"
    puts @chart2.title
  end
  
end