module Jsj
  module PullData
    class DbData
      attr_reader :jsj_form_id, :form_identify, :db_data
      def initialize( jsj_form_id, source_enroll_data, loop_count: nil )
        # results: {"total"=>7, "count"=>7, "data"=>[{"serial_number"=>1...}..], "next"=>nil}
        # data: sign up datum array
        # next: when not next, it will be nil.
        # @form_identify = form_identify
        # @conf = jsj_form_id.conference
        @jsj_form_id = jsj_form_id

        @db_data = get_jsj_range_array_in_db(source_enroll_data, loop_count)
      end

      def find_db_datum(jsj_id)
        db_data.find { |d| d.jsj_id == jsj_id }
      end

      def remain
        db_data.select do |datum|
          # false and nil .blank? is ture
          datum.deleted.blank?
        end
      end

      def jsj_ids
        remain ? (remain.map {|item| item.jsj_id}) : []
      end

      def select_db_array(jsj_ids)
        db_data.select { |d| jsj_ids.include?(d.jsj_id) }
      end

      private

      def get_jsj_range_array_in_db(source_enroll_data, loop_count)
        # first loop start jsj_id from 1.
        start_id = ( (loop_count == 0) ? 1 : source_enroll_data.first.jsj_id )
        end_id = source_enroll_data.last.jsj_id

        Backend::AttendDatum.where( jsj_form_id: jsj_form_id.id ).and( Backend::AttendDatum.where( jsj_id: (start_id..end_id).to_a ) )
      end


    end
  end
end
