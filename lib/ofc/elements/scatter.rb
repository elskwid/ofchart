module Ofc
  class Elements

    # Scatter chart
    # :colour         : hex color (#3030d0)
    # :dot-size   : integer (5) *
    # :font-size  : integer (12)
    # :text       : string ('')
    # :width      : integer (2)
    class Scatter < Base
      attr_accessor_with_default :colour,     '#3030d0'
      attr_accessor_with_default :dot_size,   5
      attr_accessor_with_default :font_size,  12
      attr_accessor_with_default :text,       ''
      attr_accessor_with_default :width,      2
                    
      alias_attribute :color, :colour
    end
                 
  end
end