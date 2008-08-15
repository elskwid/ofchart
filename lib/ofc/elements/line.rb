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
    end
    
    # LineDot
    #  * defaults from Line class
    class LineDot < Line; end
    
    # LineHollow
    # :colour     : hexcolor (#80a033)
    # :font-size  : integer (10)
    # :dot-size   : (6)
    class LineHollow < Line; end
    
  end
end