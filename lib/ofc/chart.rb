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
    attr_accessor_with_default :options,        {} # internal
    attr_accessor_with_default :background,     Ofc::Chart::Background.new
    attr_accessor_with_default :elements,       []
    attr_accessor_with_default :title,          Ofc::Chart::Title.new
    attr_accessor_with_default :tool_tip,       Ofc::Chart::ToolTip.new
    attr_accessor_with_default :x_axis,         Ofc::Chart::XAxis.new
    attr_accessor_with_default :x_axis_labels,  Ofc::Chart::XAxisLabels.new
    attr_accessor_with_default :x_legend,       Ofc::Chart::XLegend.new
    attr_accessor_with_default :y_axis,         Ofc::Chart::YAxis.new
    attr_accessor_with_default :y_axis_labels,  Ofc::Chart::YAxisLabels.new
    attr_accessor_with_default :y2_axis,        Ofc::Chart::Y2Axis.new
    attr_accessor_with_default :y2_axis_labels, Ofc::Chart::Y2AxisLabels.new
    attr_accessor_with_default :y_legend,       Ofc::Chart::YLegend.new
    attr_accessor_with_default :y2_legend,      Ofc::Chart::Y2Legend.new

    # TODO: Provide a way to pass in hashes for a bunch of this stuff
  end
  
end
