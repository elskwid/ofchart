module Ofc
  class Chart
    # XLegend
    # style : css style : (?)
    # text  : string : (null)
    class XLegend
      attr_accessor :style,
                    :text
    end
              
    # YLegend
    # style : css style : (?)
    # text  : string : (null)
    class YLegend
      attr_accessor :style,
                    :text
      # json name y_legend
    end
    
    # Y2Legend (right)
    # style : css style : (?)
    # text  : string : (null)
    class Y2Legend
      attr_accessor :style,
                    :text
      # json name y2_legend
    end
    
  end
end