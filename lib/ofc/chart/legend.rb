module Ofc
  class Chart
    # XLegend
    # style : css style : (?)
    # text  : string : (null)
    class XLegend < Base
      attr_accessor_with_default :style,  ''
      attr_accessor_with_default :text,   ''
    end
              
    # YLegend
    # style : css style : (?)
    # text  : string : (null)
    class YLegend < Base
      attr_accessor_with_default :style,  ''
      attr_accessor_with_default :text,   ''
      # json name y_legend
    end
    
    # Y2Legend (right)
    # style : css style : (?)
    # text  : string : (null)
    class Y2Legend < Base
      attr_accessor_with_default :style,  ''
      attr_accessor_with_default :text,   ''
      # json name y2_legend
    end
    
  end
end