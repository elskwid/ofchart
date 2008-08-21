module Ofc
  class Elements

    # BarBase
    # :alpha      : integer (?)
    # :colour     : hex color (#3030d0)
    # :font-size  : integer (12) 
    # :text       : string ('')
    # :tip        : string (?)
    class BarBase < Base
      default_chart_attributes  :alpha      =>  nil,
                                :colour     =>  '#3030d0',
                                :font_size  =>  12,
                                :text       =>  '',
                                :tip        =>  nil
                    
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
      default_chart_attributes  :outline_colour   =>  '#000000' 
      
      alias_attribute :outline_color, :outline_colour
    end
    
    # BarSketch
    # :outline-colour : hex color (#000000)
    # :offset         : integer (3)    
    class BarSketch < BarBase
      default_chart_attributes  :outline_colour   =>  '#000000',
                                :offset           =>  3
                    
      alias_attribute :outline_color, :outline_colour
    end

    # BarStack
    class BarStack < BarBase; end

    # HBar
    # :colour     : hex color (?)
    # :font-size  : integer (?)
    # :text       : string (null)
    class HBar < Base
      default_chart_attributes  :colour     =>  nil,
                                :font_size  =>  nil,
                                :text       =>  ''
                    
      alias_attribute :color, :colour
    end
    
  end
end