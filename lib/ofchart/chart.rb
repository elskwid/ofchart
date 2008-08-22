module Ofchart
  
  # A similar idea to Gchart (in fact, some of these ideas are right from GChart) and the other Open Flash Chart libraries, 
  # this is a shortcut to build charts using OFC. Ofc::x is there to help keep it all composed.
  class Chart
    
    # supported chart types
    @@types = ['bar', 'bar_3d', 'bar_candle', 'bar_fade', 'bar_filled', 'bar_glass', 'bar_outline', 'bar_sketch', 'bar_stack', 'hbar',
               'area_hollow', 'line', 'line_dot', 'line_hollow', 'pie', 'scatter']
    
    attr_accessor :title, :type, :width, :height

    # alias_method :bar_color=, :bar_colors=
    # alias_method :line_colors=, :bar_colors=
    # alias_method :line_color=, :bar_colors=
    # alias_method :labels=, :legend=
    # alias_method :horizontal?, :horizontal
    # alias_method :grouped?, :grouped
    
    class << self
      def method_missing(meth, options={})
      end
      
      def supported_types
        @@types.join(' ')
      end
    end
    
    def initialize(options={})
      # defaults
      @type = :line
      @data = []
      @width = 300
      @height = 200
      # @horizontal = false
      # @grouped = false
      # @encoding = 'simple'
      # @max_value = 'auto'
      # @alt = 'Open Flash Chart'
      # @id = false
      # @class = false

      # set the options value if definable
      options.each do |attribute, value| 
          send("#{attribute.to_s}=", value) if self.respond_to?("#{attribute}=")
      end
    end
    
    def size=(size='300x200')
      @width, @height = size.split("x").map { |dimension| dimension.to_i }
    end
    
    def size
      "#{@width}x#{@height}"
    end
    
    # need to use hbar if horiz
    def orientation=(orientation='h')
      @horizontal = false
      @horizontal = true if %w(h horizontal).include? orientation
    end
    
    # need to use bar_stack if stacked
    def stacked=(option=true)
      @grouped = option ? false : true
    end
    
    def bg=(options)
      if options.is_a?(String)
        @bg_color = options
      elsif options.is_a?(Hash)
        @bg_color = options[:color]
        @bg_type = options[:type]
        @bg_angle = options[:angle]
      end
    end
    # alias_method :background=, :bg=
    
    def graph_bg=(options)
      if options.is_a?(String)
        @chart_color = options
      elsif options.is_a?(Hash)
        @chart_color = options[:color]
        @chart_type = options[:type]
        @chart_angle = options[:angle]
      end
    end
    # alias_method :chart_bg=, :graph_bg=
    # alias_method :chart_color=, :graph_bg=
    # alias_method :chart_background=, :graph_bg=
        
    private
    
      def build_chart
        @ofchart = Ofc::Chart.new
        # @width & @height are outside the chart (part of the html/js)
        
        @ofchart.background.bg_colour = @bg_color
        # currently we ignore @bg_type & @bg_angle
        @element = chart_factory(@type)
        
      end
      
      def chart_factory(type)
        case type
          when :bar         : Ofc::Elements::Bar.new
          when :bar_3d      : Ofc::Elements::Bar3D.new
          when :bar_candle  : Ofc::Elements::BarCandle.new
          when :bar_fade    : Ofc::Elements::BarFade.new
          when :bar_glass   : Ofc::Elements::BarGlass.new
          when :bar_filled  : Ofc::Elements::BarFilled.new
          when :bar_outline : Ofc::Elements::BarOutline.new
          when :bar_sketch  : Ofc::Elements::BarSketch.new
          when :bar_stack   : Ofc::Elements::BarStack.new
          when :hbar        : Ofc::Elements::HBar.new
          when :area_hollow : Ofc::Elements::AreaHollow.new
          when :line        : Ofc::Elements::Line.new
          when :line_dot    : Ofc::Elements::LineDot.new
          when :line_hollow : Ofc::Elements::LineHollow.new
          when :pie         : Ofc::Elements::Pie.new
          when :scatter     : Ofc::Elements::Scatter.new
        end
      end
      
  end
  
end