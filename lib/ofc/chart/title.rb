module Ofc
  class Chart
    # Title
    # style : css style : (?)
    # text  : string : (null)
    class Title < Base
      default_chart_attributes  :object_name  =>  'title',
                                :style        =>  '',
                                :text         =>  ''
    end
    
    # css style can contain:
    # font-size
    # color
    # background-color
    # text-align
    # margin
    # margin-left
    # margin-right
    # margin-top
    # margin-bottom
    # padding
    # padding-left
    # padding-right
    # padding-top
    # padding-bottom    
  end
end