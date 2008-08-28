module Ofc
  class Elements

    # BarBase
    # :alpha      : integer (?)
    # :colour     : hex color (#3030d0)
    # :font-size  : integer (12) 
    # :text       : string ('')
    # :tip        : string (?)
    class BarBase < Base
      default_chart_attributes  :type  =>  '',
                                :alpha        =>  nil,
                                :colour       =>  '#3030d0',
                                :font_size    =>  12,
                                :text         =>  '',
                                :tip          =>  nil
                                                    
      alias_attribute :color, :colour
    end
    
    # Bar
    class Bar < BarBase
      default_chart_attributes  :type  =>  'bar'
    end

    # Bar3D
    class Bar3D < BarBase
      default_chart_attributes  :type  =>  'bar_3d'
    end
    
    # BarCandle
    class BarCandle < BarBase
      default_chart_attributes  :type  =>  'bar_candle' #could be candle
    end
    
    # BarFade
    class BarFade < BarBase
      default_chart_attributes  :type  =>  'bar_fade'
    end
    
    # BarGlass
    class BarGlass < BarBase
      default_chart_attributes  :type  =>  'bar_glass'
    end
    
    # BarOutline - This one is floating around in the code base, but doesn't look to work!
    # :outline-colour : hex color (#000000)
    class BarOutline < BarBase
      default_chart_attributes  :type      =>  'bar_outline',
                                :outline_colour   =>  '#000000' 
      
      alias_attribute :outline_color, :outline_colour
    end
    
    # BarFilled (just another name for BarOutline)
    class BarFilled < BarBase
      default_chart_attributes  :type      =>  'bar_filled',
                                :outline_colour   =>  '#000000' 
      
      alias_attribute :outline_color, :outline_colour
    end
    
    # BarSketch
    # :outline-colour : hex color (#000000)
    # :offset         : integer (3)    
    class BarSketch < BarBase
      default_chart_attributes  :type      =>  'bar_sketch',
                                :outline_colour   =>  '#000000',
                                :offset           =>  3
                    
      alias_attribute :outline_color, :outline_colour
    end

    # BarStack
    class BarStack < BarBase
      default_chart_attributes  :type  =>  'bar_stack'
    end

    # HBar
    # :colour     : hex color (?)
    # :font-size  : integer (?)
    # :text       : string (null)
    class HBar < Base
      default_chart_attributes  :type  =>  'hbar',
                                :colour       =>  nil,
                                :font_size    =>  nil,
                                :text         =>  ''
                    
      alias_attribute :color, :colour
    end
    
  end
end