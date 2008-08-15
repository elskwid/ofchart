require File.dirname(__FILE__) + '/spec_helper'

describe Ofc::Chart do
  
  before :each do
    @chart = Ofc::Chart.new
  end
  
  it "should have a few of the basic attributes" do
    [:options, :title].each do |attr|
      @chart.should respond_to(attr)
    end
  end  
  
  it "should have new objects for all default attributes" do
    @chart.background.should be_a_kind_of(Ofc::Chart::Background)
    @chart.elements.should be_a_kind_of(Array)
    @chart.title.should be_a_kind_of(Ofc::Chart::Title)
    @chart.tool_tip.should be_a_kind_of(Ofc::Chart::ToolTip)
    @chart.x_axis.should be_a_kind_of(Ofc::Chart::XAxis)
    @chart.x_axis_labels.should be_a_kind_of(Ofc::Chart::XAxisLabels)
    @chart.x_legend.should be_a_kind_of(Ofc::Chart::XLegend)
    @chart.y_axis.should be_a_kind_of(Ofc::Chart::YAxis)
    @chart.y_axis_labels.should be_a_kind_of(Ofc::Chart::YAxisLabels)
    @chart.y2_axis.should be_a_kind_of(Ofc::Chart::Y2Axis)
    @chart.y2_axis_labels.should be_a_kind_of(Ofc::Chart::Y2AxisLabels)
    @chart.y_legend.should be_a_kind_of(Ofc::Chart::YLegend)
    @chart.y2_legend.should be_a_kind_of(Ofc::Chart::Y2Legend)
  end

  
end