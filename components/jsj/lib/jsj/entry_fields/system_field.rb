module Jsj
  class EntryFields
    class SystemField
      attr_reader :field_identify, :label, :type
      attr_accessor :raw_value

      # entry_field: ["serial_number", 3]
      def initialize(entry_field)
        @field_identify = entry_field[0]
        @label = @field_identify
        @type = entry_field[0]
        @raw_value = entry_field[1]
      end

      def humanize_value
        raw_value
      end


    end
  end
end
