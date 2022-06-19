module Jsj
  module RenderPdfs
    class Excel

      attr_reader :attend_form_data
      def initialize(file_path)
        # parse excel file
        sheet = Roo::Excelx.new(file_path).sheet(0)
        @attend_form_data = sheet.parse(headers: true, skip_blanks: true)
      end

      def render_guangxi_pdfs
        attend_form_data[1..-1].each do |attend_datum|
          params = {
            name: attend_datum['name'],
            date_range_str: attend_datum['date_range_str'],
            subject_name: attend_datum['subject_name']
          }

          render_guangxi_pdf(params)
        end
      end

      private

      def render_guangxi_pdf(params)
        pdf = Render.new.render_guangxi_pdf(params)
        file_name = [ params[:name] ].compact.join('-')
        pdf.render_file "#{Jsj::RenderPdfs.render_location}/#{file_name}.pdf"
      end


    end
  end
end