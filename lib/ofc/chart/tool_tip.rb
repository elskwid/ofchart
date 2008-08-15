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
    class ToolTip
      attr_accessor :background,
                    :body,
                    :colour,
                    :mouse,
                    :rounded,
                    :shadow,
                    :stroke, 
                    :text,
                    :title
                    
      alias_attribute :color, :colour
      
      def initialize
        @background = '#f0f0f0'
        @body = "color: #000000; font-weight: normal; font-size: 12;"
        @colour = '#808080'
        @mouse = nil
        @rounded = 1
        @shadow = true
        @stroke = 2
        @text = ''
        @title = "color: #0000F0; font-weight: bold; font-size: 12;"
      end
    end
  end
end