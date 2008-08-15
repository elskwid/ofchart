module Ofc
  class Elements

    # BarBase
    # :alpha      : integer (?)
    # :colour     : hex color (#3030d0)
    # :font-size  : integer (12)
    # :text       : string ('')
    # :tip        : string (?)
    class BarBase < Base
      attr_accessor :alpha,
                    :colour,
                    :font_size, #font-size
                    :text,
                    :tip
                    
      alias_attribute :color, :colour
      
      def initialize
        super
        @alpha = nil
        @colour = '#3030d0'
        @font_size = 12
        @text = ''
        @tip = nil
      end
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
      attr_accessor :outline_colour # outline-colour
      
      alias_attribute :outline_color, :outline_colour
      
      def initialize
        super
        @outline_colour = '#000000'
      end
    end
    
    # BarSketch
    # :outline-colour : hex color (#000000)
    # :offset         : integer (3)    
    class BarSketch < BarBase
      attr_accessor :outline_colour, # outline-colour
                    :offset
                    
      alias_attribute :outline_color, :outline_colour
      
      def initialize
        super
        @outline_colour = '#000000'
        @offset = 3
      end
    end

    # BarStack
    class BarStack < BarBase; end

    # HBar
    # :colour     : hex color (?)
    # :font-size  : integer (?)
    # :text       : string (null)
    class HBar < Base
      attr_accessor :colour,
                    :font_size, # font-size
                    :text
                    
      alias_attribute :color, :colour
      
      def initialize
        super
        @colour = nil
        @font_size = nil
        @text = ''
      end
    end
  end
end