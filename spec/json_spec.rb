require File.dirname(__FILE__) + '/spec_helper'

describe Ofc::Chart do
  
  before :each do
    @chart = Ofc::Chart.new
  end
  
  it "should produce json when to_json is called" do
    puts "*********************************************************"
    @title = Ofc::Chart::Title.new(:text => 'the new default')
    puts @title.inspect
    @title.text = "hi"
    puts @title.inspect

    puts @chart.to_json
    
  end
  
end