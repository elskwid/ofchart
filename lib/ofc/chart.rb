require 'ofc/chart/axes'
require 'ofc/chart/background'
require 'ofc/chart/legend'
require 'ofc/chart/title'
require 'ofc/chart/tool_tip'

module Ofc
  # Chart is combination of all the elements(bar, line, hollow line, etc)
  # with a title and labels. It is the 'canvas' for the other objects
  
  class Chart
    attr_accessor :options, # internal
                  :background,
                  :elements,
                  :title,
                  :tool_tip,
                  :x_axis,
                  :x_axis_labels,
                  :x_legend,
                  :y_axis,
                  :y_axis_labels,
                  :y2_axis,
                  :y2_axis_labels,
                  :y_legend,
                  :y2_legend

    def initialize(opts={})
      @background = Background.new
      @elements= []
      @title = Title.new
      @tool_tip = ToolTip.new
      @x_axis = XAxis.new
      @x_axis_labels = XAxisLabels.new
      @x_legend = XLegend.new
      @y_axis = YAxis.new
      @y_axis_labels = YAxisLabels.new
      @y2_axis = Y2Axis.new
      @y2_axis_labels = Y2AxisLabels.new
      @y_legend = YLegend.new
      @y2_legend = Y2Legend.new
      # options_to_attributes opts
    end
  end
end
