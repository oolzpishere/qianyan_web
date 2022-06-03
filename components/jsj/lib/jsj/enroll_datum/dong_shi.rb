module Jsj
  module EnrollDatum
    class DongShi < Base
      # @entry: String or Hash; raw_entry json string, or parsed json to hash.
      def self.create(entry, sign_up_form, extra_opts: {})
        self.new(entry, sign_up_form,  extra_opts: extra_opts)
      end

      def stream_code_sms_identify
        "simple_stream_code"
      end

    end
  end
end
