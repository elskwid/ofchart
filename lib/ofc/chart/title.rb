module Ofc
  class Chart
    # Title
    # style : css style : (?)
    # text  : string : (null)
    class Title < Base
      default_chart_attributes  :style  =>  '',
                                :text   =>  ''
    end
    
  end
end