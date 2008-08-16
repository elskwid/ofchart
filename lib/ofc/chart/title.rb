module Ofc
  class Chart
    # Title
    # style : css style : (?)
    # text  : string : (null)
    class Title < Base
      attr_accessor_with_default :style,  ''
      attr_accessor_with_default :text,   ''
    end
    
  end
end