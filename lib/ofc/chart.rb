require 'ofc/chart/base'
require 'ofc/chart/axes'
require 'ofc/chart/background'
require 'ofc/chart/legend'
require 'ofc/chart/title'
require 'ofc/chart/tool_tip'

module Ofc
  
  # Chart is combination of all the elements(bar, line, hollow line, etc)
  # with a title and labels. It is the 'canvas' for the other objects
  class Chart
    include Ofc::JSON
    # TODO: Provide a way to pass in hashes for a bunch of this stuff
    default_chart_attributes  :object_name      =>  '',
                              :width            =>  200,
                              :height           =>  300,
                              :options          =>  Hash.new, # internal
                              :background       =>  Ofc::Chart::Background.new,
                              :elements         =>  Array.new,
                              :title            =>  Ofc::Chart::Title.new,
                              :tool_tip         =>  nil,
                              :x_axis           =>  nil,
                              :x_legend         =>  nil,
                              :y_axis           =>  nil,
                              :y2_axis          =>  nil,
                              :y_legend         =>  nil,
                              :y2_legend        =>  nil
                              
                              # Don't really want these to be created all the time. Only when we need them
                              # :tool_tip         =>  Ofc::Chart::ToolTip.new,
                              # :x_axis           =>  Ofc::Chart::XAxis.new,
                              # :x_legend         =>  Ofc::Chart::XLegend.new,
                              # :y_axis           =>  Ofc::Chart::YAxis.new,
                              # :y2_axis          =>  Ofc::Chart::Y2Axis.new,
                              # :y_legend         =>  Ofc::Chart::YLegend.new,
                              # :y2_legend        =>  Ofc::Chart::Y2Legend.new

    # convenience method to get the chart type
    def type
      elements.first.type
    end
  end
  
end
