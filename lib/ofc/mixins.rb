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
      set_options_attributes(options)
    end
   
    private
      # So we can pass in a hash of values for defined attributes
      def set_options_attributes(opts={})
        @options = opts
        if opts.kind_of? Hash
          opts.each do |k,v| 
            self.send("#{k.to_sym}=",v) if self.respond_to? k.to_sym
          end
        end
      end
    
  end
  
end