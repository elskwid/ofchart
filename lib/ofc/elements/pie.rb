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
      default_chart_attributes  :object_name    =>  'pie',
                                :alpha          =>  0.5,
                                :animate        =>  1,
                                :colour         =>  '#900000',
                                :colours        =>  ['#900000', '#009000'],
                                :gradient_fill  =>  1,
                                :start_angle    =>  90,
                                :stroke         =>  1,
                                :tip            =>  nil
                    
      alias_attribute :color, :colour
      alias_attribute :colors, :colours
    end

  end
end