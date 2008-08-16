module Ofc
  class Elements
    # BaseLine
    # :colour     : hex color (?)
    # :dot-size   : integer (?)
    # :halo-size  : integer (?)
    # :tip        : ?
    class BaseLine < Base
      attr_accessor_with_default :colour,    nil
      attr_accessor_with_default :dot_size,  nil
      attr_accessor_with_default :halo_size, nil
      attr_accessor_with_default :tip,       nil

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
      attr_accessor_with_default :colour,     '#3030d0'
      attr_accessor_with_default :dot_size,   5
      attr_accessor_with_default :font_size,  12
      attr_accessor_with_default :halo_size,  2
      attr_accessor_with_default :text,       ''
      attr_accessor_with_default :tip,        nil      
      attr_accessor_with_default :width,      2
      # color accessor added in BaseLine
    end
    
    # LineDot
    #  * defaults from Line class
    class LineDot < Line; end
    
    # LineHollow
    # :colour     : hexcolor (#80a033)
    # :font-size  : integer (10)
    # :dot-size   : (6)
    class LineHollow < Line
      attr_accessor_with_default :colour,     '#80a033'      
      attr_accessor_with_default :font_size,  10
      attr_accessor_with_default :dot_size,   6            
    end
    
  end
end