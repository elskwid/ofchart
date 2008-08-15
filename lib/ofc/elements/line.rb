module Ofc
  class Elements
    # BaseLine
    # :colour     : hex color (?)
    # :dot-size   : integer (?)
    # :halo-size  : integer (?)
    # :tip        : ?
    class BaseLine < Base
      attr_accessor :colour,
                    :dot_size, #dot-size
                    :halo_size, #halo_size
                    :tip

      alias_attribute :color, :colour
    end
    
    # Line
    # :colour     : hexcolor (#3030d0) *
    # :dot-size   : integer (5) *
    # :font-size  : integer (12)
    # :halo-size  : integer (2) *
    # :text       : string ('')
    # :tip        : string (value of point) *
    # :width      : integer (2)
    #     * declared in base class
    class Line < BaseLine
      attr_accessor :font_size, #font-size
                    :text,
                    :width
                    
      def initialize
        super
        @colour = '#3030d0'
        @dot_size = 5
        @font_size = 12
        @halo_size = 2
        @text = ''
        @tip = nil # this *really gets set by ofc chart
        @width = 2
      end
    end
    
    # LineDot
    #  * defaults from Line class
    class LineDot < Line; end
    
    # LineHollow
    # :colour     : hexcolor (#80a033)
    # :font-size  : integer (10)
    # :dot-size   : (6)
    class LineHollow < Line
      def initialize
        super
        @colour = '#80a033'
        @font_size = 10
        @dot_size = 6
      end
    end
    
  end
end