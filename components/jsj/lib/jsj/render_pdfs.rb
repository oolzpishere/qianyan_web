module Jsj
  class RenderPdfs
    RENDER_LOCATION = "/Users/leeli/Downloads/pdfs"

    def jsj_form_render(form_identify, filter: {})
      attend_data = get_data(form_identify, filter: filter)
      attend_data.each do |attend_datum|
        render_pdf(attend_datum)
      end
      # render each datum
    end

    def get_data(form_identify, filter: {})
      # where select
      jsj_form = Backend::JsjForm.find_by(form_identify: form_identify)
      params = {jsj_form_id: jsj_form.id} 
      params.merge!(filter)
      attend_data = Backend::AttendDatum.includes(:jsj_form).where( params )
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


  end
end
