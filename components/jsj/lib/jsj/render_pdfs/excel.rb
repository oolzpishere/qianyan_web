module Jsj
  module RenderPdfs
    class Excel

      attr_reader :attend_data
      def initialize(file_path)
        # parse excel file
        sheet = Roo::Excelx.new(file_path).sheet(0)
        @attend_form_data = sheet.parse(skip_blanks: true)
      end

      def render_guangxi_pdfs
        attend_form_data.each do |attend_datum|
          params = {}
          params[:cert_bg_type] = 'guangxi'
          params[:name] = attend_datum[0]
          params[:date_range_str] = attend_datum[1]
          params[:subject_name] = attend_datum[2]

          render_pdf(params)
        end
      end

      private

      def render_pdf(params)
        Render.new.render_pdf(params)
      end


    end
  end
end