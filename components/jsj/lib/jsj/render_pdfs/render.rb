module Jsj
  module RenderPdfs
    class Render

      ASSETS_PATH = Rails.root.join('app', 'assets')
      PUBLIC_PATH = Rails.root.join('public')
      FONT_PATH = PUBLIC_PATH.join('fonts')
      
      def gen_pdf( params = {})
        # image = MiniMagick::Image.open("certs/nation.jpg")
        backgroud_image = assets_path.join('images', 'certs', "#{params[:cert_bg_type]}.jpg")
        pdf = Prawn::Document.new(page_size: [1280, 950], 
                                  page_layout: :portrait,
                                  background:  backgroud_image)
        # pdf.image(app.asset_path("ccerts/nation.jpgerts/nation.jpg"), width: pdf.bounds.width, height: pdf.bounds.height)
        pdf.font_families.update( 
          'songti' => {
            normal: {file: "#{FONT_PATH}/FZ30.TTF"}
          },
          'msyh' => {
          normal: { file: "#{FONT_PATH}/msyh.ttf" }
        })
        pdf.fallback_fonts(['msyh'])
        pdf.font("songti", size: 26)

          # pdf.stroke_axis
        pdf.text_box(params[:name], at: [270,620] )
        pdf.draw_text(params[:date_range_str], at: [595,595])
        # pdf.move_down 25
        pdf.draw_text params[:conf_name], :at => [175,535]
        pdf.draw_text params[:conf_name], :at => [904,535]
        pdf
      end


    end
  end
end