module Ofc
  class Chart
    # XAxis
    # colour      : hex color (#784016)
    # grid_colour : hex color (#F5E1AA)
    # max         : integer|null (null)
    # min         : integer (0)
    # offset      : boolean (true)
    # steps       : integer (1)
    # stroke      : integer (2)
    # three_d     : integer (0)
    # tick_height : integer (3)
    class XAxis
      attr_accessor :colour,
                    :grid_colour,
                    :max,
                    :min,
                    :offset,
                    :steps,
                    :stroke,
                    :three_d, # 3d
                    :tick_height
                     
      alias_attribute :color, :colour
      alias_attribute :grid_color, :grid_colour
    end
  
    # XAxis Labels
    # colour  : hex color (#000000)
    # labels  : array ([])
    # rotate  : integer null|1|2 (null)
    # size    : integer (10)
    # steps   : integer (1)
    # visible : boolean (true)
    class XAxisLabels
      attr_accessor :colour,
                    :labels,
                    :rotate,
                    :size,
                    :steps,
                    :visible

      alias_attribute :color, :colour
    end
    
    
    # YAxisBase
    # colour      : hex color (#784016)
    # grid_colour : hex color (#F5E1AA)
    # max         : integer|null (null) [10 for YAxis right]
    # min         : integer (0)
    # offset      : boolean (false)
    # steps       : integer (1)
    # stroke      : integer (2)
    # three_d     : integer (0)
    # tick_length : integer (3)    
    # visible     : boolean (true) [false for YAxis right]
    class YAxisBase
      attr_accessor :colour,
                    :grid_colour,
                    :max,
                    :min,
                    :offset,
                    :steps,
                    :stroke,
                    :three_d,
                    :tick_length,
                    :visible

      alias_attribute :color, :colour
      alias_attribute :grid_color, :grid_colour 
    end
    
    class YAxis < YAxisBase
      # json name y_axis
    end
    
    class Y2Axis < YAxisBase
      # json name y_axis_right
    end
    
    # YAxis LabelsBase
    # colour  : hex color (#000000)
    # labels  : array ([])
    # size    : integer (10)
    # steps   : integer (?)
    # visible : boolean (true)
    class YAxisLabelsBase
      attr_accessor :colour,
                    :labels,
                    :size,
                    :steps,
                    :visible
                    
      alias_attribute :color, :colour
    end

    class YAxisLabels < YAxisLabelsBase
      # json name y_label_
    end
    
    class Y2AxisLabels < YAxisLabelsBase
      # json name y_label_2_
    end
    
  end
  
end