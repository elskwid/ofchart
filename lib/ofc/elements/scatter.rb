module Ofc
  class Elements

    # Scatter chart
    # :colour         : hex color (#3030d0)
    # :dot-size   : integer (5) *
    # :font-size  : integer (12)
    # :text       : string ('')
    # :width      : integer (2)
    class Scatter < Base
      default_chart_attributes  :type  =>  'scatter',
                                :colour       =>  '#3030d0',
                                :dot_size     =>  5,
                                :font_size    =>  12,
                                :text         =>  '',
                                :width        =>  2
                    
      alias_attribute :color, :colour
    end
                 
  end
end