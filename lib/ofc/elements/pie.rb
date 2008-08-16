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
      attr_accessor_with_default :alpha,          0.5
      attr_accessor_with_default :animate,        1
      attr_accessor_with_default :colour,         '#900000'
      attr_accessor_with_default :colours,        ['#900000', '#009000']
      attr_accessor_with_default :gradient_fill,  1
      attr_accessor_with_default :start_angle,    90
      attr_accessor_with_default :stroke,         1
      attr_accessor_with_default :tip,            nil
                    
      alias_attribute :color, :colour
      alias_attribute :colors, :colours
    end

  end
end