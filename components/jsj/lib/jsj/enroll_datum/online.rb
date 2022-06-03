module Jsj
  module EnrollDatum
    module Online

      def self.create(entry, sign_up_form, extra_opts: {})
        occupation = extra_opts[:occupation].occupation
        way = extra_opts[:way].way
        province = extra_opts[:province].province 

        "Jsj::EnrollDatum::Online::Base".constantize.new(entry, sign_up_form, extra_opts: extra_opts)
      end

    end
  end
end
