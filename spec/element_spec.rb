require File.dirname(__FILE__) + '/spec_helper'

# Tests for the 'contract' of the elements
describe Ofc::Elements::Base do
  
  it "should have a base element type with the default fields (not values)" do
    b = Ofc::Elements::Base.new
    b.should respond_to(:values)
    b.values.should be_empty
  end

end

# Bar element tests
describe Ofc::Elements::BarBase do
  
  it "should have the default fields and values" do
    attributes = {:alpha => nil,
                  :colour => '#3030d0',
                  :font_size => 12, #font-size
                  :text => '',
                  :tip => nil,
                  :color => '#3030d0'}
    b = Ofc::Elements::BarBase.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end
  
end

# These tests are to make sure these subclasses don't change without us knowing :-)
describe Ofc::Elements::Bar do
  
  # same as barbase
  it "should have the default fields and values" do
    attributes = {:alpha => nil,
                  :colour => '#3030d0',
                  :font_size => 12, #font-size
                  :text => '',
                  :tip => nil,
                  :color => '#3030d0'}
    b = Ofc::Elements::Bar.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end  
  
end

describe Ofc::Elements::Bar3D do
  
  # same as barbase
  it "should have the default fields and values" do
    attributes = {:alpha => nil,
                  :colour => '#3030d0',
                  :font_size => 12, #font-size
                  :text => '',
                  :tip => nil,
                  :color => '#3030d0'}
    b = Ofc::Elements::Bar3D.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end  
  
end

describe Ofc::Elements::BarCandle do
  
  # same as barbase
  it "should have the default fields and values" do
    attributes = {:alpha => nil,
                  :colour => '#3030d0',
                  :font_size => 12, #font-size
                  :text => '',
                  :tip => nil,
                  :color => '#3030d0'}
    b = Ofc::Elements::BarCandle.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end  
  
end

describe Ofc::Elements::BarFade do
  
  # same as barbase
  it "should have the default fields and values" do
    attributes = {:alpha => nil,
                  :colour => '#3030d0',
                  :font_size => 12, #font-size
                  :text => '',
                  :tip => nil,
                  :color => '#3030d0'}
    b = Ofc::Elements::BarFade.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end  
  
end

describe Ofc::Elements::BarGlass do
  
  # same as barbase
  it "should have the default fields and values" do
    attributes = {:alpha => nil,
                  :colour => '#3030d0',
                  :font_size => 12, #font-size
                  :text => '',
                  :tip => nil,
                  :color => '#3030d0'}
    b = Ofc::Elements::BarGlass.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end  
  
end

describe Ofc::Elements::BarOutline do
  
  it "should have the default fields and values" do
    attributes = {:alpha => nil,
                  :colour => "#3030d0",
                  :font_size => 12, #font-size
                  :text => '',
                  :tip => nil,
                  :outline_colour => '#000000',
                  :color => "#3030d0",
                  :outline_color => '#000000'
                  }
    b = Ofc::Elements::BarOutline.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end  
  
end

describe Ofc::Elements::BarSketch do
  
  it "should have the default fields and values" do
    attributes = {:alpha => nil,
                  :colour => "#3030d0",
                  :font_size => 12, #font-size
                  :text => '',
                  :tip => nil,
                  :outline_colour => '#000000',
                  :offset => 3,
                  :color => "#3030d0",
                  :outline_color => '#000000'
                  }
    b = Ofc::Elements::BarSketch.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end  
  
end

describe Ofc::Elements::BarStack do
  
  it "should have the default fields and values" do
    attributes = {:alpha => nil,
                  :colour => '#3030d0',
                  :font_size => 12, #font-size
                  :text => '',
                  :tip => nil,
                  :color => '#3030d0'}
    b = Ofc::Elements::BarStack.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end  
  
end

describe Ofc::Elements::HBar do
  
  it "should have the default fields and values" do
    attributes = {:colour => nil,
                  :font_size => nil, #font-size
                  :text => '',
                  :color => nil}
    b = Ofc::Elements::HBar.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end
    
end

# Line element tests
describe Ofc::Elements::BaseLine do
  
  it "should have the default fields and values" do
    attributes = {:colour => nil,
                  :dot_size => nil, #dot-size
                  :halo_size => nil, #halo_size
                  :tip => nil,
                  :color => nil}
    b = Ofc::Elements::BaseLine.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end
    
end

describe Ofc::Elements::Line do
    
  it "should have the default fields and values" do
    attributes = {:colour => '#3030d0',
                  :dot_size => 5, #dot-size
                  :font_size => 12,
                  :halo_size => 2, #halo_size
                  :text => '',
                  :tip => nil,
                  :width => 2}
    b = Ofc::Elements::Line.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end
  
end

describe Ofc::Elements::LineDot do
  
  # same as line class
  it "should have the default fields and values" do
    attributes = {:colour => '#3030d0',
                  :dot_size => 5, #dot-size
                  :font_size => 12,
                  :halo_size => 2, #halo_size
                  :text => '',
                  :tip => nil,
                  :width => 2}
    b = Ofc::Elements::LineDot.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end
  
end

describe Ofc::Elements::LineHollow do
  
  # same as line class with a few overriden settings
  it "should have the default fields and values" do
    attributes = {:colour => '#80a033',
                  :dot_size => 6, #dot-size
                  :font_size => 10,
                  :halo_size => 2, #halo_size
                  :text => '',
                  :tip => nil,
                  :width => 2}
    b = Ofc::Elements::LineHollow.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end
  
end


# Pie element tests
describe Ofc::Elements::Pie do
  
  it "should have the default fields and values" do
    attributes = {:alpha => 0.5,
                  :animate => 1,
                  :colours => ['#900000','#009000'],
                  :font_size => 10,
                  :gradient_fill => 1, # gradient-fill
                  :label_colour => '#900000',
                  :start_angle => 90, # start-angle
                  :stroke => 1,
                  :tip => nil,
                  :label_color => '#900000',
                  :colors => ['#900000','#009000']}
    b = Ofc::Elements::Pie.new
    attributes.each do |k,v|
      b.should respond_to(k)
      b.send(k).should == v
    end
  end  
  
end


# Scatter element tests
describe Ofc::Elements::Scatter do

    it "should have the default fields and values" do
      attributes = {:colour => '#3030d0',
                    :dot_size => 5, #dot-size
                    :font_size => 12,  # font-size
                    :text => '',
                    :width => 2,
                    :color => '#3030d0'}
      b = Ofc::Elements::Scatter.new
      attributes.each do |k,v|
        b.should respond_to(k)
        b.send(k).should == v
      end
    end  
  
end



