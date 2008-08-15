module Ofc
  class Elements

    # Scatter chart
    # :colour     : hex color (#3030d0)
    # :dot-size   : integer (5)
    # :font-size  : integer (12)
    # :text       : string ('')
    # :values     : array ([]) *
    # :width      : integer (2)
    #     * declared in base
    class Scatter < Base
      attr_accessor :colour,
                    :dot_size, #dot-size
                    :font_size,  # font-size
                    :text,
                    :width
                    
      alias_attribute :color, :colour
    end
                 
  end
end