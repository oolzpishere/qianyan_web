module Jsj
  module EnrollDatum
    module Online
      class Base < Jsj::EnrollDatum::Base

        
        def stream_code_sms_identify
          # student and teacher use same stream_code_sms_identify.
          _occupation = "teacher"
          "#{conference.eng_name}_#{_occupation}_stream_code"
        end

      end

    end
  end
end
