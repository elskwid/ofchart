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
      # TODO: get the 'name' of the object
      if self.class.respond_to? :chart_attributes
        result = {}
        self.class.chart_attributes.inject(result) do |r,name|
          r[name] = self.send(name)
          r
        end
        result.to_json(*a)    
      else
        # call the default from json...
        super
      end
    end
    
  end
      
end