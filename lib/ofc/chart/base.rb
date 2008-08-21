module Ofc
  
  class Chart

    # Base class used for chart items
    class Base
      # include Ofc::HashedAttributes
      include Ofc::JSON
      
      # Anything?
      def initialize(options={})
        # nada
      end
      
    end
    
  end
end
