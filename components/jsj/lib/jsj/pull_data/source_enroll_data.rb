module Jsj
  module PullData
    class SourceEnrollData
      attr_reader :form_identify, :enroll_data, :db_data, :jsj_ids
      def initialize( form_identify, data, loop_count: nil)
        @form_identify = form_identify
        @enroll_data = data.map {|d| Jsj::EnrollDatum.create(d, form_identify) if d}
        @db_data = DbData.new(sign_up_form, enroll_data, loop_count: loop_count)

        @jsj_ids = enroll_data.map {|item| item.jsj_id}
      end

      def create_source_jsj_ids
        jsj_ids - intersection_jsj_ids
      end

      def intersection_jsj_ids
        jsj_ids & db_data.jsj_ids
      end

      def delete_db_jsj_ids
        # not exist in source jsj ids
        db_data.jsj_ids - jsj_ids
      end

      def update_source_jsj_ids
        compare_entry_diff_with_db(intersection_jsj_ids)
      end

      # compare each one with db, and return difference source jsj_ids array.
      # def compare_source_intersection_data(source_intersection_data)
      def compare_entry_diff_with_db(intersection_jsj_ids)
        diff_jsj_ids = []
        select_jsj_ids(intersection_jsj_ids).each do |source_datum|
          jsj_id = source_datum.jsj_id
          # find_db_datum(jsj_id).entry is stringify_keys
          if (source_datum.entry.deep_stringify_keys != find_db_datum(jsj_id).entry)
            diff_jsj_ids << jsj_id
          end
        end
        diff_jsj_ids
      end

      def restore_deleted_db_data
        db_data.select_db_array(create_source_jsj_ids)
      end

      def restore_deleted_jsj_ids
        restore_deleted_db_data.map { |db_datum| db_datum.jsj_id }
      end

      def real_create_source_jsj_ids
        create_source_jsj_ids - restore_deleted_jsj_ids
      end

      def need_to_create_data
        select_jsj_ids(real_create_source_jsj_ids)
      end

      def find_datum(jsj_id)
        enroll_data.find { |d| d.jsj_id == jsj_id }
      end

      private

      def sign_up_form
        @sign_up_form ||= Backend::JsjForm.find_by(form_identify: form_identify)
      end

      def find_db_datum(jsj_id)
        db_data.find_db_datum(jsj_id)
      end

      def select_jsj_ids(jsj_ids)
        enroll_data.select do |d|
          jsj_ids.include?( d.jsj_id )
        end
      end

    end
  end
end
