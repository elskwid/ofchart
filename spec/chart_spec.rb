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

# Axes tests
describe Ofc::Chart::XAxis do

  it "should have the default fields and values" do
    attributes = {:colour => '#784016',
                  :grid_colour => '#f5e1aa',
                  :max => nil,
                  :min => 0,
                  :offset => true,
                  :steps => 1,
                  :stroke => 2,
                  :three_d => 0, # 3d
                  :tick_height => 3,
                  :color => '#784016',
                  :grid_color => '#f5e1aa'}
    b = Ofc::Chart::XAxis.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end
  
  it "should provide a way of using a hash of values for the initial values" do
    
    initial_values = {:colour => '#FFFFFF', :grid_color => '#eee', :max => 100, :offset => false}
    x = Ofc::Chart::XAxis.new(initial_values)

    initial_values.each do |k,v|
      x.send(k).should == v
    end
  end
end

describe Ofc::Chart::XAxisLabels do

  it "should have the default fields and values" do
    attributes = {:colour => '#000000',
                  :labels => [],
                  :rotate => nil,
                  :size => 10,
                  :steps => 1,
                  :visible => true,
                  :color => '#000000'}
    b = Ofc::Chart::XAxisLabels.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end
    
end  

describe Ofc::Chart::YAxisBase do
  
  it "should have the default fields and values" do
    attributes = {:colour => '#784016',
                  :grid_colour => '#f5e1aa',
                  :max => nil,
                  :min => 0,
                  :offset => false,
                  :steps => 1,
                  :stroke => 2,
                  :three_d => 0,
                  :tick_length => 3,
                  :visible => true,
                  :color => '#784016',
                  :grid_colour => '#f5e1aa'}
    b = Ofc::Chart::YAxisBase.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end
    
end

# same as base
describe Ofc::Chart::YAxis do #< YAxisBase
    # json name y_axis
    
    it "should have the default fields and values" do
      attributes = {:colour => '#784016',
                    :grid_colour => '#f5e1aa',
                    :max => nil,
                    :min => 0,
                    :offset => false,
                    :steps => 1,
                    :stroke => 2,
                    :three_d => 0,
                    :tick_length => 3,
                    :visible => true,
                    :color => '#784016',
                    :grid_colour => '#f5e1aa'}
      b = Ofc::Chart::YAxis.new
      attributes.each do |k,v|
        b.should respond_to(k)
        b.send(k).should == v
      end
    end
        
end
  
# same as base
describe Ofc::Chart::Y2Axis do #< YAxisBase
    # json name y_axis_right
    
    it "should have the default fields and values" do
      attributes = {:colour => '#784016',
                    :grid_colour => '#f5e1aa',
                    :max => 10,
                    :min => 0,
                    :offset => false,
                    :steps => 1,
                    :stroke => 2,
                    :three_d => 0,
                    :tick_length => 3,
                    :visible => false,
                    :color => '#784016',
                    :grid_colour => '#f5e1aa'}
      b = Ofc::Chart::Y2Axis.new
      attributes.each do |k,v|
        b.should respond_to(k)
        b.send(k).should == v
      end
    end
        
end
  
  # YAxis LabelsBase
  # colour  : hex color (#000000)
  # labels  : array ([])
  # size    : integer (10)
  # steps   : integer (?)
  # visible : boolean (true)
describe Ofc::Chart::YAxisLabelsBase do
  
  it "should have the default fields and values" do
    attributes = {:colour => '#000000',
                  :labels => [],
                  :size => 10,
                  :steps => nil,
                  :visible => true,
                  :color => '#000000'}
    b = Ofc::Chart::YAxisLabelsBase.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end

end

# same as base
describe Ofc::Chart::YAxisLabels do # < YAxisLabelsBase
    # json name y_label_
    
    it "should have the default fields and values" do
      attributes = {:colour => '#000000',
                    :labels => [],
                    :size => 10,
                    :steps => nil,
                    :visible => true,
                    :color => '#000000'}
      b = Ofc::Chart::YAxisLabels.new
      attributes.each do |k,v|
        b.should respond_to(k)
        b.send(k).should == v
      end
    end
        
end
  
# same as base
describe Ofc::Chart::Y2AxisLabels do #< YAxisLabelsBase
    # json name y_label_2_
    
    it "should have the default fields and values" do
      attributes = {:colour => '#000000',
                    :labels => [],
                    :size => 10,
                    :steps => nil,
                    :visible => true,
                    :color => '#000000'}
      b = Ofc::Chart::Y2AxisLabels.new
      attributes.each do |k,v|
        b.should respond_to(k)
        b.send(k).should == v
      end
    end
        
end


# Background tests
describe Ofc::Chart::Background do
  
  it "should have the default fields and values" do
    attributes = {:bg_colour => '#f8f8d8',
                  :bg_image => nil,
                  :bg_color => '#f8f8d8',
                  :color => '#f8f8d8',
                  :image => nil}
    b = Ofc::Chart::Background.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end
  
end


# Legend tests

describe Ofc::Chart::XLegend do
  attr_accessor :style,
                :text
                
  it "should have the default fields and values" do
    attributes = {:style => nil,
                  :text => nil}
    b = Ofc::Chart::XLegend.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end
                  
end
          
# YLegend
describe Ofc::Chart::YLegend do
  # json name y_legend
  
  it "should have the default fields and values" do
    attributes = {:style => nil,
                  :text => nil}
    b = Ofc::Chart::YLegend.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end  
  
end

# Y2Legend (right)
describe Ofc::Chart::Y2Legend do
  # json name y2_legend
  
  it "should have the default fields and values" do
    attributes = {:style => nil,
                  :text => nil}
    b = Ofc::Chart::Y2Legend.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end
    
end

# Title
describe Ofc::Chart::Title do
  # json name y2_legend
  
  it "should have the default fields and values" do
    attributes = {:style => nil,
                  :text => nil}
    b = Ofc::Chart::Title.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end
    
end

# ToolTip
describe Ofc::Chart::ToolTip do

  it "should have the default fields and values" do
    attributes = {:background => '#f0f0f0',
                  :body => "color: #000000; font-weight: normal; font-size: 12;",
                  :colour => '#808080',
                  :mouse => nil,
                  :rounded => 1,
                  :shadow => true,
                  :stroke => 2, 
                  :text => '',
                  :title => "color: #0000F0; font-weight: bold; font-size: 12;",
                  :color => '#808080'}
    b = Ofc::Chart::ToolTip.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end
    
end