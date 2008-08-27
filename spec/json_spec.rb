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

# Since this JSON is being created from hashes mostly, we can't count on the order, so we need to 
# just check if certain values are present.

describe Ofc::Chart::Title do
  it "should output the correct default json" do
    @title = Ofc::Chart::Title.new
    json = @title.to_json.to_s
    json.should include('"text": ""')
  end

  it "should output the correct updated json" do
    @title = Ofc::Chart::Title.new(:style => 'font-size:20pt;', :text => 'NEWTITLE')
    @title.to_json.should include("NEWTITLE")
    @title.text = "ANOTHER NEW TITLE"
    @title.to_json.should include("ANOTHER NEW TITLE")
  end
end

describe Ofc::Chart::ToolTip do
  it "should output the correct default json" do
    @tooltip = Ofc::Chart::ToolTip.new
    json = @tooltip.to_json.to_s
    json.should include('"title": "{color: #0000F0; font-weight: bold; font-size: 12;}"')
    json.should include('"rounded": 1')
  end

  it "should output the correct updated json" do
    @tooltip = Ofc::Chart::ToolTip.new(:stroke => 5, :text => 'my tooltip')
    @tooltip.to_json.should include('"text": "my tooltip"')
    @tooltip.text = "ANOTHER NEW TITLE"
    @tooltip.to_json.should include("ANOTHER NEW TITLE")
  end    
end

# Make sure to test some of the objects that inherit attributes
describe Ofc::Chart::YAxis do
  it "should have the correct default json" do
    @yaxis = Ofc::Chart::YAxis.new
    json = @yaxis.to_json.to_s
    json.should include('"grid-colour": "#f5e1aa"')
    json.should include('"tick-length": 3')
  end
  
  it "should have the correct updated json" do
    @yaxis = Ofc::Chart::YAxis.new
    @yaxis.colour = '#eee'
    @yaxis.to_json.should include('"colour": "#eee"')
  end  
end

describe Ofc::Elements::Bar do
  it "should output the correct default json" do
    @bar = Ofc::Elements::Bar.new
    json = @bar.to_json.to_s
    json.should include('"type": "bar"')
    # json.should include('"alpha": null') nulls removed
    json.should include('"values": []')
  end

  it "should output the correct updated json" do
    @bar = Ofc::Elements::Bar.new(:values => [1,2,3,4,5])
    @bar.to_json.should include('"values": [1,2,3,4,5]')
    @bar.text = "ANOTHER NEW TITLE"
    @bar.to_json.should include("ANOTHER NEW TITLE")
    @bar.to_json.should include('"values": [1,2,3,4,5]')
  end
end