module Jsj
  module EnrollDatum
    module Occupation 
      class Base 
        attr_reader :raw_occupation

        def initialize(field_value)
          @raw_occupation = field_value.to_s
        end

        def name
          occupation
        end

        def occupation
          raw_occupation
        end

      end
    end
  end
end