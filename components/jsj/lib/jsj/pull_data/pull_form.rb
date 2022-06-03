module Jsj
  module PullData
    class PullForm
      # https://jinshuju.net/api/v1/forms/xxx(表单token)/entries
      # https://jinshuju.net/api/v1/forms/xxx(表单token)/entries?next=xx（next值）
      BASE_ENTRIES_API="https://jinshuju.net/api/v1/forms/"
      attr_reader :form_identify

      def initialize( form_identify )
        @form_identify = form_identify
      end

      def pull_form
        loop_curl
      end

      def send_request(url)
        response = RestClient::Request.execute(
          {
            method: :get,
            url: url,
            headers: { Authorization: "Basic " + Base64::encode64(auth_details) }
          }
        )
        unless response_success?(response)
          raise "request fail, response code not eq 2**"
        end
        # response.to_str json: "{\"total\":7,\"count\":7,\"data\":[{\"serial_number\":1,...}, {..}..], \"next\":null}"
        # data: sign up datum array
        # next: when not next, it will be nil.
        results = JSON.parse(response.to_str)
      end

      def gen_next_url( next_num = nil )
        uri = URI(BASE_ENTRIES_API + form_identify + "/entries")
        if next_num
          uri.query = "next=#{next_num}"
        end
        uri.to_s
      end
      
      private

      def sign_up_form
        @sign_up_form ||= Backend::JsjForm.find_by(form_identify: form_identify)
      end
      # loop curl data
      # if next, curl again
      def loop_curl
        next_num = nil
        loop_count = 0
        begin
          url = gen_next_url(next_num)
          results = send_request(url)

          next_num = results["next"]
          # handle_results(results)
          HandleResults.new(form_identify, results, loop_count: loop_count).invoke
          loop_count += 1
        end while next_num
      end

      def response_success?(response)
        response && ( response.code.to_s.match(/^2/) )
      end

      def auth_details
        ENV.fetch("JINSHUJU_API_KEY") + ":" + ENV.fetch("JINSHUJU_API_SECRET")
      end

    end
  end
end
