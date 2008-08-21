module Ofc
  class Elements
    # BaseLine
    # :colour     : hex color (?)
    # :dot-size   : integer (?)
    # :halo-size  : integer (?)
    # :tip        : ?
    class BaseLine < Base
      default_chart_attributes  :colour     =>  nil,
                                :dot_size   =>  nil,
                                :halo_size  =>  nil,
                                :tip        =>  nil

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
      default_chart_attributes  :colour     =>  '#3030d0',
                                :dot_size   =>  5,
                                :font_size  =>  12,
                                :halo_size  =>  2,
                                :text       =>  '',
                                :tip        =>  nil,
                                :width      =>  2
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
      default_chart_attributes  :colour     =>  '#80a033',
                                :font_size  =>  10,
                                :dot_size   =>  6            
    end
    
  end
end