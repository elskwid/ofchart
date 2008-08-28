module Ofc
  # Provides a way to pass a hash of values to the initialize method
  # of a class and have any keys that are attributes of that class
  # sent to the class with the corresponding value.
  #
  # example = SomeClass.new(:name => 'Buckaroo', :girlfriend => 'Penny Priddy')
  #  Would set example.name = 'Buckaroo' and example.girlfriend = 'Penny Priddy'
  #
  # Skips any keys that aren't attributes of the class.
  # Provides an options attribute to retrieve the passed in hash
  module HashedAttributes
    attr_accessor :options
    
    def initialize(options={})
      super()
      set_options_attributes(options)
    end
   
    private
      # So we can pass in a hash of values for defined attributes
      def set_options_attributes(opts={})
        @options = opts
        if opts.kind_of? Hash
          opts.each do |k,v| 
            self.send("#{k.to_sym}=",v) if self.respond_to? k.to_sym
            puts "@#{k} -> #{v}"
            # instance_variable_set( "@#{k}", v )            
          end
        end
      end
    
  end


  module JSON    
    def to_json(*a)
      ofc_keys = {
        :grid_colour    => 'grid-colour',
        :three_d        => '3d',
        :tick_height    => 'tick-height',
        :tick_length    => 'tick-length',
        :font_size      => 'font-size',
        :outline_colour => 'outline-colour',
        :dot_size       => 'dot-size',
        :halo_size      => 'halo-size',
        :gradient_fill  => 'gradient-fill',
        :start_angle    => 'start-angle',
        :label_colour   => 'label-colour'
      }
      if self.class.respond_to? :chart_attributes
        result = '{'
        result << self.class.chart_attributes.map do |key|
          # check object for object_name and add it to the keys
          # ofc_keys[key] = self.send(key).object_name if self.send(key).respond_to? :object_name
          obj_name = self.send(key).object_name if self.send(key).respond_to? :object_name
          # skip some named fields and those that return nil
          "#{(obj_name||ofc_keys[key]||key).to_json}: #{self.send(key).to_json}" unless key == :object_name || self.send(key).nil?
        end.reject{|k| k.nil?} * ', '
        result << '}'
      else
        super
      end
    end
    
  end
      
end