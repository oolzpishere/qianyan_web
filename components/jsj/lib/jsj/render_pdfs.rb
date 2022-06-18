module Jsj
  class RenderPdfs
    RENDER_LOCATION = "/Users/leeli/Downloads/pdfs"

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
      pdf.render_file "#{RENDER_LOCATION}/#{file_name}.pdf"

    end

    private

    def gen_country_pdf(attend_datum, cert_parser)
        # image = MiniMagick::Image.open("certs/nation.jpg")
        assets_path = Rails.root.join('app', 'assets')
        public_path = Rails.root.join('public')
        backgroud_image = assets_path.join('images', 'certs', "#{cert_parser.cert_bg_type}.jpg")
        pdf = Prawn::Document.new(page_size: [1280, 950], 
                                  page_layout: :portrait,
                                  background:  backgroud_image)
        # pdf.image(app.asset_path("ccerts/nation.jpgerts/nation.jpg"), width: pdf.bounds.width, height: pdf.bounds.height)
        pdf.font_families.update( 
          'songti' => {
            normal: {file: "#{public_path}/fonts/FZ30.TTF"}
          },
          'msyh' => {
          normal: { file: "#{public_path}/fonts/msyh.ttf" }
        })
        pdf.fallback_fonts(['msyh'])
        pdf.font("songti", size: 26)

          # pdf.stroke_axis
        pdf.text_box(attend_datum.name, at: [270,620] )
        pdf.draw_text(cert_parser.date_range_str, at: [595,595])
        # pdf.move_down 25
        pdf.draw_text cert_parser.conference.sms_conf_name, :at => [175,535]
        pdf.draw_text cert_parser.conference.sms_conf_name, :at => [904,535]
        pdf
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
