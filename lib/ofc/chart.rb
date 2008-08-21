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
    default_chart_attributes  :options          =>  Hash.new, # internal
                              :background       =>  Ofc::Chart::Background.new,
                              :elements         =>  Array.new,
                              :title            =>  Ofc::Chart::Title.new,
                              :tool_tip         =>  Ofc::Chart::ToolTip.new,
                              :x_axis           =>  Ofc::Chart::XAxis.new,
                              :x_axis_labels    =>  Ofc::Chart::XAxisLabels.new,
                              :x_legend         =>  Ofc::Chart::XLegend.new,
                              :y_axis           =>  Ofc::Chart::YAxis.new,
                              :y_axis_labels    =>  Ofc::Chart::YAxisLabels.new,
                              :y2_axis          =>  Ofc::Chart::Y2Axis.new,
                              :y2_axis_labels   =>  Ofc::Chart::Y2AxisLabels.new,
                              :y_legend         =>  Ofc::Chart::YLegend.new,
                              :y2_legend        =>  Ofc::Chart::Y2Legend.new

    # TODO: Provide a way to pass in hashes for a bunch of this stuff
    
    def to_json(*a)
      {
        'background' => background.to_json(*a),
        'tool_tip' => tool_tip.to_json(*a),
        'title' => title.to_json(*a)
      }
    end
  end
  
end
