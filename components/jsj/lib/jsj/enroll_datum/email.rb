module Jsj
  module EnrollDatum
    class Email < Base

      def self.create(entry, sign_up_form, extra_opts: {})
        way = extra_opts[:way].way || "online"

        "Jsj::EnrollDatum::Email".constantize.new(entry, sign_up_form,  extra_opts: extra_opts)
      end



    end
  end
end
