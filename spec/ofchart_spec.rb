require File.dirname(__FILE__) + '/spec_helper'

describe Ofchart::Chart do
  
  before :each do
    Ofchart::Theme.add_theme_file(File.dirname(__FILE__) + '/test_themes.yml')
    @chart = Ofchart::Chart.new
  end
  
  it "should have a few of the basic attributes" do
    [:width, :title, :type, :width, :height].each do |attr|
      @chart.should respond_to(attr)
    end
  end  

  it "should produce a list of the supported types" do
    Ofchart::Chart.supported_types.should include('bar')
  end
  
  it "should allow me to set the size" do
    @chart.size = '500x450'
    @chart.size.should == '500x450'
    @chart.width.should == 500
    @chart.height.should == 450
    @chart.width = 125
    @chart.width.should == 125
  end
  
  it "should have the default theme at init" do
    # we don't know what these will be, so we use a test file below
    @chart.theme.should == 'default'
  end
  
  it "should load the test_default theme" do
    # :colors:
    #   - &blue 6886B4
    #   - &yellow FDD84E
    #   - &green 72AE6E
    #   - &red D1695E
    #   - &purple 8A6EAF
    #   - &orange EFAA43
    #   - &white FFFFFF
    #   - &black !str 000000
    # :color: *black
    # # :bar_colors: [ *blue, *yellow, *green, *red, *purple, *orange ]
    # :background: *white
    # :title_color: *black
    # :title_size: &titlesize 12
    # :legend_size: &legendsize 11
    # :legend_color: &grey dadada
    # :key_size: *titlesize
    # :x_size: &xsize 10
    # :x_color: *black
    # :y_size: *xsize
    # :y_color: *black
    # :grid_color: EEE
    # :rounded: false
    # :animated: false    
    @chart = Ofchart::Chart.new(:theme => 'test_default')
    @chart.theme.should == 'test_default'
    @chart.colors.should include('6886B4')
    @chart.colors.should include('FDD84E')
    @chart.colors.should include('72AE6E')
    @chart.colors.should include('D1695E')
    @chart.colors.should include('8A6EAF')
    @chart.colors.should include('EFAA43')
    @chart.colors.should include('FFFFFF')
    @chart.colors.should include('000000')
    @chart.color.should == '000000'
    @chart.background_color.should == 'FFFFFF'
    @chart.title_color.should == '000000'
    @chart.title_size.should == 12
    @chart.x_legend_size.should == 11
    @chart.y_legend_size.should == 11
    @chart.x_legend_color.should == 'dadada'
    @chart.y_legend_color.should == 'dadada'
    @chart.x_key_size.should == 12
    @chart.grid_color.should == 'EEE'
    @chart.tip_rounded.should == false
    @chart.animate_pie.should == false
  end
  
  it "should load the test_thirty7signals theme" do
    # :colors:
    #   - &green 339933
    #   - &purple cc99cc
    #   - &blue 336699
    #   - &yellow FFF804
    #   - &red ff0000
    #   - &orange cf5910
    # # :bar_colors: [ *yellow, *blue, *green, *red, *purple, *orange ]
    # :background: *white
    # # change font sizes to 15
    # :title_size: 15
    # :legend_size: 15
    # :x_size: 15
    # :y_size: 15    
    @chart = Ofchart::Chart.new(:theme => 'test_thirty7signals')
    @chart.theme.should == 'test_thirty7signals'
    @chart.colors.should include('339933')
    @chart.colors.should include('cc99cc')
    @chart.colors.should include('336699')
    @chart.colors.should include('FFF804')
    @chart.colors.should include('ff0000')
    @chart.colors.should include('cf5910')
    @chart.color.should == '000000'
    @chart.background_color.should == 'FFFFFF'
    @chart.title_color.should == '000000'
    @chart.title_size.should == 15
    @chart.x_legend_size.should == 15
    @chart.y_legend_size.should == 15
    @chart.x_key_size.should == 15
    @chart.tip_rounded.should == false
    @chart.animate_pie.should == false
  end  
  
  it "should use the title_style passed in" do
    @chart = Ofchart::Chart.new(:title_style => {'font-size' => 8, 'color' => '#EEEEEE'})
    chart_obj = @chart.build_chart
    chart_obj.title.style.should include('font-size:8')
    chart_obj.title.style.should include('color:#EEEEEE')
  end
  
  it "should override the title style with size and color" do
    @chart = Ofchart::Chart.new(:title_size => 28, :title_color => '#AAAAAA')
    chart_obj = @chart.build_chart
    chart_obj.title.style.should include('font-size:28')
    chart_obj.title.style.should include('color:#AAAAAA')
  end
  
  it "should output a chart object" do
   chart_obj = @chart.build_chart 
   chart_obj.should be_a_kind_of(Ofc::Chart)
  end
  
  it "should be able to create the json" do
    chart_obj = @chart.build_chart 
    chart_obj.to_json.should include('"type": "line"')
  end

  it "should be able to create a bar chart" do
    chart = Ofchart::Chart.bar(:title => 'my bar chart')
    chart.elements.first.type.should == 'bar'
    chart.type.should == 'bar'
  end
  
  it "should be able to create the supported chart types" do
    # chart types
    Ofchart::Chart.supported_types.each do |chart_type|
      chart = Ofchart::Chart.send(chart_type.to_sym)
      chart.type.should == chart_type
      chart.should be_a_kind_of(Ofc::Chart)
    end
  end
  
  it "should not create a chart with an unsupported type" do
    Ofchart::Chart.not_supported(:title => 'awesome chart').should_not be_a_kind_of(Ofc::Chart)
  end
  
end

