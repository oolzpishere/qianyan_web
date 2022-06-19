module Jsj
  module RenderPdfs
    class JsjForm

      attr_reader :attend_form_data
      def initialize(form_identify)
        @attend_form_data = get_form_data(form_identify)
      end

      def jsj_form_render( filter: {})
        filter_attend_data(attend_form_data, filter: filter).each do |attend_datum|
          render_pdf(attend_datum)
        end
      end

      def get_form_data(form_identify)
        # where select
        jsj_form = Backend::JsjForm.find_by(form_identify: form_identify)
        attend_data = Backend::AttendDatum.includes(:jsj_form).where( {jsj_form_id: jsj_form.id} )
        # filter(attend_data)
      end

      def render_pdf(attend_datum)
        cert_parser = Frontend::CertParser.new(attend_datum)
        pdf = gen_country_pdf( attend_datum, cert_parser )
        file_name = [attend_datum.school, attend_datum.name].compact.join('-')
        pdf.render_file "#{Jsj::RenderPdfs.render_location}/#{file_name}.pdf"
      end

      private

        def gen_country_pdf(attend_datum, cert_parser)
          params = {
            name: attend_datum.name,
            date_range_str: cert_parser.date_range_str,
            subject_name: cert_parser.conference.sms_conf_name
          }

          Jsj::RenderPdfs::Render.new.render_country_pdf(params)
        end
        
        def filter_attend_data(attend_data, filter: {})
          return attend_data if filter.blank?
          attend_data.select do |attend_datum|
            match_filter?(attend_datum, filter)
          end
        end

        def match_filter?(attend_datum, filter)
          filter.each do |key, value|
            return true if attend_datum.send(key).match(value)
          end
        end
    end
  end
end
