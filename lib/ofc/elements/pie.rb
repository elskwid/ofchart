module Ofc
  class Elements

    # Pie chart
    # :alpha          : float (0.5)
    # :animate        : integer (1) 1||0 ?
    # :colour         : hex color (#900000)
    # :colours        : array of hex colors (["#900000", "#009000"])
    # :gradient-fill  : integer (1)
    # :start-angle    : integer (90)
    # :stroke         : integer (1)
    # :tip            : string ('#val# of #total#')
    class Pie < Base
      attr_accessor :alpha,
                    :animate,
                    :colour,
                    :colours,
                    :gradient_fill, # gradient-fill
                    :start_angle, # start-angle
                    :stroke,
                    :tip
                    
      alias_attribute :color, :colour
      alias_attribute :colors, :colours
    end

  end
end