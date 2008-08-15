require File.dirname(__FILE__) + '/spec_helper'

describe Ofc do
  
  before :each do
    # this one has all the default fun
    @chart = Ofc::Chart.new
  end
  
  it "should be able to add a new title" do
    title = Ofc::Chart::Title.new
    title.text = "NEW TITLE"
    @chart.title = title
    @chart.title.text.should == "NEW TITLE"
  end
  
  it "should be able to add a new background" do
    bg = Ofc::Chart::Background.new
    bg.bg_colour = '#FFFFFF'
    @chart.background = bg
    @chart.background.bg_colour.should == '#FFFFFF'
    @chart.background.color.should == '#FFFFFF'
  end

  it "should be able to add a new axis" do
    x = Ofc::Chart::XAxis.new
    x.colour = '#eee'
    @chart.x_axis = x
    @chart.x_axis.colour.should == '#eee'
    @chart.x_axis.color.should == '#eee'
  end

  
end