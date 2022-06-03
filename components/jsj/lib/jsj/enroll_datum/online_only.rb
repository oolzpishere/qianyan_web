module Jsj
  module EnrollDatum
    class OnlineOnly < Base

      def self.create(entry, sign_up_form, extra_opts: {})
        occupation = extra_opts[:occupation].occupation

        "Jsj::EnrollDatum::OnlineOnly".constantize.new(entry, sign_up_form,  extra_opts: extra_opts)
      end

      def stream_code_sms_identify
        # student temporary use same sms_code with teacher.
        _occupation = "teacher"
        "#{conference.eng_name}_#{_occupation}_stream_code"
      end

    end
  end
end
