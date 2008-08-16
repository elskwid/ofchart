module Ofc
  class Elements

    # BarBase
    # :alpha      : integer (?)
    # :colour     : hex color (#3030d0)
    # :font-size  : integer (12) 
    # :text       : string ('')
    # :tip        : string (?)
    class BarBase < Base
      attr_accessor_with_default :alpha,      nil
      attr_accessor_with_default :colour,     '#3030d0'
      attr_accessor_with_default :font_size,  12
      attr_accessor_with_default :text,       ''
      attr_accessor_with_default :tip,        nil
                    
      alias_attribute :color, :colour
    end
    
    # Bar
    class Bar < BarBase; end

    # Bar3D
    class Bar3D < BarBase; end
    
    # BarCandle
    class BarCandle < BarBase; end
    
    # BarFade
    class BarFade < BarBase; end
    
    # BarGlass
    class BarGlass < BarBase; end
    
    # BarOutline
    # :outline-colour : hex color (#000000)
    class BarOutline < BarBase
      attr_accessor_with_default :outline_colour, '#000000' 
      
      alias_attribute :outline_color, :outline_colour
    end
    
    # BarSketch
    # :outline-colour : hex color (#000000)
    # :offset         : integer (3)    
    class BarSketch < BarBase
      attr_accessor_with_default :outline_colour, '#000000' 
      attr_accessor_with_default :offset,         3
                    
      alias_attribute :outline_color, :outline_colour
    end

    # BarStack
    class BarStack < BarBase; end

    # HBar
    # :colour     : hex color (?)
    # :font-size  : integer (?)
    # :text       : string (null)
    class HBar < Base
      attr_accessor_with_default :colour,     nil
      attr_accessor_with_default :font_size,  nil 
      attr_accessor_with_default :text,       ''
                    
      alias_attribute :color, :colour
    end
    
  end
end