module Ofc
  class Elements
    
    # Base element
    # :values : array ([])
    class Base
      include Ofc::JSON
      default_chart_attributes  :values   =>  []
    end
    
  end
end
