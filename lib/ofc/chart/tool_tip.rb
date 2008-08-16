module Ofc
  class Chart
    # ToolTip
    # :background : hex color (#f0f0f0)
    # :body : style ("color: #000000; font-weight: normal; font-size: 12;")
    # :colour : hex color (#808080)
    # :mouse : ? (Tooltip.CLOSET)
    # :rounded : integer (1)
    # :shadow : boolean (true)
    # :stroke : integer (2)
    # :text : string (_default)
    # :title : style ("color: #0000F0; font-weight: bold; font-size: 12;")
    class ToolTip < Base
      attr_accessor_with_default :background,  '#f0f0f0'
      attr_accessor_with_default :body,         "color: #000000; font-weight: normal; font-size: 12;"
      attr_accessor_with_default :colour,       '#808080'
      attr_accessor_with_default :mouse,        nil
      attr_accessor_with_default :rounded,      1
      attr_accessor_with_default :shadow,       true
      attr_accessor_with_default :stroke,       2
      attr_accessor_with_default :text,         ''
      attr_accessor_with_default :title,        "color: #0000F0; font-weight: bold; font-size: 12;"
                    
      alias_attribute :color, :colour
    end
    
  end
end