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
    # three_d     : integer (0) # 3d
    # tick_height : integer (3)
    class XAxis < Base
      attr_accessor_with_default :colour,      '#784016'
      attr_accessor_with_default :grid_colour, '#f5e1aa'
      attr_accessor_with_default :max,         nil
      attr_accessor_with_default :min,         0
      attr_accessor_with_default :offset,      true
      attr_accessor_with_default :steps,       1
      attr_accessor_with_default :stroke,      2
      attr_accessor_with_default :three_d,     0 # 3d
      attr_accessor_with_default :tick_height, 3
                     
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
    class XAxisLabels  < Base
      attr_accessor_with_default :colour,   '#000000'
      attr_accessor_with_default :labels,   []
      attr_accessor_with_default :rotate,   nil
      attr_accessor_with_default :size,     10
      attr_accessor_with_default :steps,    1
      attr_accessor_with_default :visible,   true

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
    class YAxisBase < Base
      attr_accessor_with_default :colour,       '#784016'
      attr_accessor_with_default :grid_colour,  '#f5e1aa'
      attr_accessor_with_default :max,          nil
      attr_accessor_with_default :min,          0
      attr_accessor_with_default :offset,       false
      attr_accessor_with_default :steps,        1
      attr_accessor_with_default :stroke,       2
      attr_accessor_with_default :three_d,      0
      attr_accessor_with_default :tick_length,  3
      attr_accessor_with_default :visible,      true

      alias_attribute :color, :colour
      alias_attribute :grid_color, :grid_colour 
    end
    
    # YAxis
    class YAxis < YAxisBase
      # json name y_axis
    end
    
    #Y2Axis
    # max         : integer|null (10)
    # visible     : boolean (false)
    class Y2Axis < YAxisBase
      attr_accessor_with_default :max,      10
      attr_accessor_with_default :visible,  false
      # json name y_axis_right
    end
    
    # YAxis LabelsBase
    # colour  : hex color (#000000)
    # labels  : array ([])
    # size    : integer (10)
    # steps   : integer (?)
    # visible : boolean (true)
    class YAxisLabelsBase
      attr_accessor_with_default :colour,   '#000000'
      attr_accessor_with_default :labels,   []
      attr_accessor_with_default :size,     10
      attr_accessor_with_default :steps,    nil
      attr_accessor_with_default :visible,  true
                    
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