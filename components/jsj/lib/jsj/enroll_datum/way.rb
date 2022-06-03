module Jsj
  module EnrollDatum
    class Way 
      WAYS = {
        "现场" => "attend",
        "线上" => "online",
        "现场参会" => "attend",
        "线上参会" => "online"
      }
      DEFAULT_WAY = "online"

      def self.create( raw_way, form_group: nil)
        self.new(raw_way)
      end

      attr_reader :raw_way

      def initialize(raw_way)
        @raw_way = raw_way
      end

      def name
        way
      end

      def way
         @way ||= if raw_way.blank?
          DEFAULT_WAY
        else
          WAYS[ raw_way ]
        end
      end


    end
  end
end
