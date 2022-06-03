module Jsj
  module PullData
    class HandleResults
      attr_reader :form_identify, :sign_up_form, :conf, :source_enroll_data, :db_data

      def initialize( form_identify, results, loop_count: nil )
        # results: {"total"=>7, "count"=>7, "data"=>[{"serial_number"=>1...}..], "next"=>nil}
        # data: sign up datum array
        # next: when not next, it will be nil.
        @form_identify = form_identify
        @sign_up_form = Backend::JsjForm.find_by(form_identify: form_identify)
        @conf = sign_up_form.conference
        data = results["data"]
        if !data.blank?
          @source_enroll_data ||= SourceEnrollData.new(form_identify, data, loop_count: loop_count)
          @db_data ||= source_enroll_data.db_data
        end
      end

      def invoke
        # retrun, if source_enroll_data not set, means nothing need to process.
        return unless source_enroll_data

        # create_source_jsj_ids
        create_source_data(source_enroll_data.create_source_jsj_ids)
        # delete_db_jsj_ids
        soft_delete_db_data( source_enroll_data.delete_db_jsj_ids)
        # update diff: update_source_jsj_ids
        update_db_data( source_enroll_data.update_source_jsj_ids)
      end

      private

      def create_source_data(create_source_jsj_ids)
        restore_deleted_db_data

        _created_sign_up_data = Backend::SignUpDatum.create(
          source_enroll_data.need_to_create_data.map {|d| d.to_params}
        )
      end

      def restore_deleted_db_data
        source_enroll_data.restore_deleted_db_data.each { |db_datum|  db_datum.update( deleted: false ) }
      end

      def soft_delete_db_data( delete_db_jsj_ids )
        db_data.select_db_array(delete_db_jsj_ids).each do |d|
          d.update( deleted: true )
        end
      end

      def update_db_data( update_source_jsj_ids )
        _update_db_array = db_data.select_db_array(update_source_jsj_ids)
        _update_db_array.each do |d|
          d.update( source_enroll_data.find_datum(d.jsj_id).to_params )
        end
      end

    end
  end
end
