module Jsj
  module EnrollDatum
    class Province

      def self.create( field_value, form_group: nil)
        self.new( field_value, form_group: form_group)
      end

      attr_reader :raw_province

      def initialize( field_value, form_group: nil)
        @raw_province = field_value.to_s
      end

      def name
        province
      end

      def province
        @province ||= if raw_province.blank?
          'guangxi'
        elsif raw_province.match(/广西/)
          'guangxi' 
        else
          'country'
        end
      end

    end
  end
end
