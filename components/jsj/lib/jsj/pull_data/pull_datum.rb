module Jsj 
  module PullData
    class PullDatum
      include Jsj::PullData::DataRequest
      attr_reader :sign_up_datum, :sign_up_form, :form_identify,:raw_results, :jsj_id

      def initialize( sign_up_datum_id )
        @sign_up_datum = get_sign_up_datum( sign_up_datum_id )
        @jsj_id = sign_up_datum.jsj_id
        @sign_up_form = sign_up_datum.jsj_form
        @form_identify = sign_up_form.form_identify
        pull_datum
      end

      def update_to_db
        return unless updatable?
        @sign_up_datum.update( Jsj::EnrollDatum.create(new_first_data, sign_up_form).to_params )
      end

      private

      def pull_datum
        @raw_results = send_request( gen_next_url( jsj_id ) )
      end

      def get_sign_up_datum(id)
        Backend::AttendDatum.find(id)
      end

      # results: {"total"=>7, "count"=>7, "data"=>[{"serial_number"=>1...}..], "next"=>nil}
      def new_first_data
        raw_results['data'].first
      end

      def datum_in_db
        @sign_up_datum
        # SignUp::SignUpDatum.where( sign_up_form_id: sign_up_form.id, jsj_id: jsj_id )
        # SignUp::SignUpDatum.where( sign_up_form_id: sign_up_form.id ).and( SignUp::SignUpDatum.where( jsj_id: (start_id..end_id).to_a ) )
      end

      def updatable?
        datum_in_db
      end

    end
  end
end
