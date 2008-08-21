module Ofc
  class Chart
    # XLegend
    # style : css style : (?)
    # text  : string : (null)
    class XLegend < Base
      default_chart_attributes  :style    =>  '',
                                :text     =>  ''
    end
              
    # YLegend
    # style : css style : (?)
    # text  : string : (null)
    class YLegend < Base
      default_chart_attributes  :style    =>  '',
                                :text     =>  ''
      # json name y_legend
    end
    
    # Y2Legend (right)
    # style : css style : (?)
    # text  : string : (null)
    class Y2Legend < Base
      default_chart_attributes  :style    =>  '',
                                :text     =>  ''
      # json name y2_legend
    end
    
  end
end