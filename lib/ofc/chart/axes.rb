module Ofc
  class Chart
    # XAxis
    # colour      : hex color (#784016)
    # grid-colour : hex color (#F5E1AA)
    # max         : integer|null (null)
    # min         : integer (0)
    # offset      : boolean (true)
    # steps       : integer (1)
    # stroke      : integer (2)
    # 3d          : integer (0)
    # tick-height : integer (3)
    class XAxis < Base
      default_chart_attributes  :object_name  =>  'x_axis',
                                :colour       =>  '#784016',
                                :grid_colour  =>  '#f5e1aa',
                                :max          =>  nil,
                                :min          =>  0,
                                :offset       =>  true,
                                :steps        =>  1,
                                :stroke       =>  2,
                                :three_d      =>  0, # 3d
                                :tick_height  =>  3
                     
      alias_attribute :color, :colour
      alias_attribute :grid_color, :grid_colour
    end
  
    # XAxis Labels
    # colour  : hex color (#000000)
    # labels  : array ([])
    # rotate  : string (horizontal||vertical||diagonal) default horizontal
    # size    : integer (10)
    # steps   : integer (1)
    # visible : boolean (true)
    class XAxisLabels  < Base
      default_chart_attributes  :object_name  =>  'x_axis_labels',
                                :colour       =>  '#000000',
                                :labels       =>  [],
                                :rotate       =>  nil,
                                :size         =>  10,
                                :steps        =>  1,
                                :visible      =>  true

      alias_attribute :color, :colour
    end
    
    
    # YAxisBase
    # colour      : hex color (#784016)
    # grid-colour : hex color (#F5E1AA)
    # max         : integer|null (null) [10 for YAxis right]
    # min         : integer (0)
    # offset      : boolean (false)
    # steps       : integer (1)
    # stroke      : integer (2)
    # 3d          : integer (0)
    # tick-length : integer (3)    
    # visible     : boolean (true) [false for YAxis right]
    class YAxisBase < Base
      default_chart_attributes  :object_name  =>  '',
                                :colour       =>  '#784016',
                                :grid_colour  =>  '#f5e1aa',
                                :max          =>  nil,
                                :min          =>  0,
                                :offset       =>  false,
                                :steps        =>  1,
                                :stroke       =>  2,
                                :three_d      =>  0,
                                :tick_length  =>  3,
                                :visible      =>  true

      alias_attribute :color, :colour
      alias_attribute :grid_color, :grid_colour 
    end
    
    # YAxis
    class YAxis < YAxisBase
      default_chart_attributes  :object_name  =>  'y_axis'
      # json name y_axis
    end
    
    #Y2Axis
    # max         : integer|null (10)
    # visible     : boolean (false)
    class Y2Axis < YAxisBase
      default_chart_attributes  :object_name  =>  'y_axis_right',
                                :max          =>  10,
                                :visible      =>  false
      # json name y_axis_right
    end
    
    # YAxis LabelsBase
    # colour  : hex color (#000000)
    # labels  : array ([])
    # size    : integer (10)
    # steps   : integer (?)
    # visible : boolean (true)
    class YAxisLabelsBase < Base
      default_chart_attributes  :object_name  =>  '',
                                :colour       =>  '#000000',
                                :labels       =>  [],
                                :size         =>  10,
                                :steps        =>  nil,
                                :visible      =>  true
                    
      alias_attribute :color, :colour
    end

    class YAxisLabels < YAxisLabelsBase
      default_chart_attributes  :object_name  =>  'y_label_'
      # json name y_label_
    end
    
    class Y2AxisLabels < YAxisLabelsBase
      default_chart_attributes  :object_name  =>  'y_label_2_'
      # json name y_label_2_
    end
    
  end
  
end