module Jsj
  module EnrollDatum
    class EmailCountry < Base

      def self.create(entry, sign_up_form, extra_opts: {})

        self.new(entry, sign_up_form, extra_opts: extra_opts)
      end

    end
  end
end
