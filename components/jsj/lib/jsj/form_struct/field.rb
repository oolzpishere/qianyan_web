module Jsj
  class FormStruct
    class Field
      attr_reader :field_identify, :label, :type
      attr_accessor :raw_value

      def humanize_value
        raw_value
      end


    end
  end
end
