require File.dirname(__FILE__) + '/spec_helper'

describe Ofc::Chart do
  
  before :each do
    @chart = Ofc::Chart.new
  end
  
  # it "should produce json when to_json is called" do
    # puts "\n*********************************************************"
    # puts @chart.to_json
    # 
    # @new_chart = Ofc::Chart.new(:elements => [Ofc::Elements::Bar.new, Ofc::Elements::Line.new])
    # puts @new_chart.inspect
    # 
    # puts @new_chart.to_json
  # end
  
end

# Want a couple of test objects from each namespace - ::Chart and ::Elements, if these work we can 
# assume the rest do. All the to_json is doing is running through the chart_attributes and assembling them
# in a sane way. Since we test the actual attributes in other specs we just need a cross-section here.
# If you find a JSON example that blows up ... put it here baby.

describe Ofc::Chart::Title do
  it "should output the correct default json" do
    @title = Ofc::Chart::Title.new
    @title.to_json.should == '{"object_name": "title", "style": "", "text": ""}'
  end

  it "should output the correct updated json" do
    @title = Ofc::Chart::Title.new(:style => 'font-size:20pt;', :text => 'NEWTITLE')
    @title.to_json.should == '{"object_name": "title", "style": "font-size:20pt;", "text": "NEWTITLE"}'
    @title.text = "ANOTHER NEW TITLE"
    @title.to_json.should == '{"object_name": "title", "style": "font-size:20pt;", "text": "ANOTHER NEW TITLE"}'
  end
end

describe Ofc::Chart::ToolTip do
  it "should output the correct default json" do
    @tooltip = Ofc::Chart::ToolTip.new
    @tooltip.to_json.should == '{"stroke": 2, "title": "color: #0000F0; font-weight: bold; font-size: 12;", "object_name": "tooltip", "mouse": null, "background": "#f0f0f0", "text": "", "rounded": 1, "colour": "#808080", "shadow": true, "body": "color: #000000; font-weight: normal; font-size: 12;"}'
  end

  it "should output the correct updated json" do
    @tooltip = Ofc::Chart::ToolTip.new(:stroke => 5, :text => 'my tooltip')
    @tooltip.to_json.should == '{"stroke": 5, "title": "color: #0000F0; font-weight: bold; font-size: 12;", "object_name": "tooltip", "mouse": null, "background": "#f0f0f0", "text": "my tooltip", "rounded": 1, "colour": "#808080", "shadow": true, "body": "color: #000000; font-weight: normal; font-size: 12;"}'
    @tooltip.text = "ANOTHER NEW TITLE"
    @tooltip.to_json.should == '{"stroke": 5, "title": "color: #0000F0; font-weight: bold; font-size: 12;", "object_name": "tooltip", "mouse": null, "background": "#f0f0f0", "text": "ANOTHER NEW TITLE", "rounded": 1, "colour": "#808080", "shadow": true, "body": "color: #000000; font-weight: normal; font-size: 12;"}'
  end    
end

# Make sure to test some of the objects that inherit attributes
describe Ofc::Chart::YAxis do
  it "should have the correct default json" do
    @yaxis = Ofc::Chart::YAxis.new
    @yaxis.to_json.should == '{"object_name": "y_axis", "stroke": 2, "visible": true, "max": null, "3d": 0, "tick-length": 3, "offset": false, "grid-colour": "#f5e1aa", "steps": 1, "colour": "#784016", "min": 0}'
  end
  
  it "should have the correct updated json" do
    @yaxis = Ofc::Chart::YAxis.new
    @yaxis.colour = '#eee'
    @yaxis.to_json.should == '{"object_name": "y_axis", "stroke": 2, "visible": true, "max": null, "3d": 0, "tick-length": 3, "offset": false, "grid-colour": "#f5e1aa", "steps": 1, "colour": "#eee", "min": 0}'
  end  
end

describe Ofc::Elements::Bar do
  it "should output the correct default json" do
    @bar = Ofc::Elements::Bar.new
    @bar.to_json.should == '{"type": "bar", "alpha": null, "tip": null, "font-size": 12, "text": "", "colour": "#3030d0", "values": []}'
  end

  it "should output the correct updated json" do
    @bar = Ofc::Elements::Bar.new(:values => [1,2,3,4,5])
    @bar.to_json.should == '{"type": "bar", "alpha": null, "tip": null, "font-size": 12, "text": "", "colour": "#3030d0", "values": [1,2,3,4,5]}'
    @bar.text = "ANOTHER NEW TITLE"
    @bar.to_json.should == '{"type": "bar", "alpha": null, "tip": null, "font-size": 12, "text": "ANOTHER NEW TITLE", "colour": "#3030d0", "values": [1,2,3,4,5]}'
  end
end