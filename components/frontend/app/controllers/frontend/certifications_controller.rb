# coding: utf-8
module Frontend
  class CertificationsController < ApplicationController
    # before_action :set_certification, only: %i[ show edit update destroy ]
    # invisible_captcha only: [:search]
    
    include ActionView::Helpers::AssetUrlHelper
    # GET /certification_pdfs
    def index
      @certification_pdfs = CertificationPdf.all
    end

    def search

    end

    def search_datum
      name = certification_search_params[:name].strip 
      phone = certification_search_params[:phone].strip
      attend_data = Backend::AttendDatum.where({phone: phone, name: name, allow_to_print: true})

      if attend_data.blank?
        session[:search_notifier] = "未找到您的报名信息，请重新查询； 如有疑问，请联系组委会工作人员。"
        redirect_to frontend.certifications_search_path 
      else
        # todo: if have result, redirect to print pdf page
        attend_data_ids = attend_data.map(&:id).to_json
        _path = certifications_results_path + "?attend_data_ids=#{attend_data_ids}"
        redirect_to _path
      end
      # or show search result below.
      # click to print pdf, or download pdf.
    end

    def search_by_school

    end

    def results 
      attend_data_ids = params[:attend_data_ids] 
      if attend_data_ids.blank?
        redirect_to frontend.certifications_search_path
        return
      end
      attend_data_ids = JSON.parse( json_escape(attend_data_ids) )
      @attend_data = Backend::AttendDatum.where(id: attend_data_ids, allow_to_print: true)
        
    end

    def download
      respond_to do |format|
        format.pdf do
          attend_datum = Backend::AttendDatum.find(params[:id])
          pdf = gen_pdf( attend_datum )
          send_data pdf.render,  filename: "#{attend_datum.conference.full_name}-#{attend_datum.name}.pdf", type: 'application/pdf'
        end
      end
    end

    # GET /certification_pdfs/1
    def show
      respond_to do |format|
        format.pdf do
          attend_datum = Backend::AttendDatum.find(params[:id])
          pdf = gen_pdf( attend_datum )
          send_data pdf.render,  filename: "#{attend_datum.conference.full_name}-#{attend_datum.name}.pdf", type: 'application/pdf', disposition: 'inline'
        end
      end
    end


    private
      # Use callbacks to share common setup or constraints between actions.
      # def set_certification
      #   @certification_pdf = CertificationPdf.find(params[:id])
      # end

      # Only allow a list of trusted parameters through.
      def certification_search_params
        params.fetch(:certification_search, {}).permit(:name, :phone)
      end

      def gen_pdf(attend_datum)
        cert_parser = Frontend::CertParser.new(attend_datum)
        if cert_parser.occupation == "student"
          gen_student_pdf(attend_datum, cert_parser)
        else

          if cert_parser.cert_bg_type == "country"
            gen_country_pdf(attend_datum, cert_parser)
          else
            gen_guangxi_pdf(attend_datum, cert_parser)
          end
        end
        
      end

      def gen_guangxi_pdf(attend_datum, cert_parser)
        Jsj::RenderPdfs::Render.new.render_guangxi_pdf({
          name: attend_datum.name,
          date_range_str: cert_parser.date_range_str,
          subject_name: cert_parser.conference.sms_conf_name
        })
      end

      def gen_country_pdf(attend_datum, cert_parser)
        Jsj::RenderPdfs::Render.new.render_country_pdf({
          name: attend_datum.name,
          date_range_str: cert_parser.date_range_str,
          subject_name: cert_parser.conference.sms_conf_name
        })
      end

      def gen_student_pdf(attend_datum, cert_parser)
        # image = MiniMagick::Image.open("certs/nation.jpg")
        assets_path = Rails.root.join('app', 'assets')
        public_path = Rails.root.join('public')
        # byebug
        backgroud_image = assets_path.join('images', 'certs', "#{cert_parser.cert_bg_type}.jpg")
        pdf = Prawn::Document.new(page_size: [1280, 950], 
                                  page_layout: :portrait,
                                  background:  backgroud_image)
        # pdf.image(app.asset_path("ccerts/nation.jpgerts/nation.jpg"), width: pdf.bounds.width, height: pdf.bounds.height)

        pdf.font("#{public_path}/fonts/FZ30.TTF", size: 26) do
          # pdf.stroke_axis

          pdf.draw_text(attend_datum.name, at: [270,600])
          pdf.draw_text(cert_parser.date_range_str, at: [595,595])

          # pdf.move_down 25
          pdf.draw_text cert_parser.conference.sms_conf_name, :at => [175,535]
          pdf.draw_text cert_parser.conference.sms_conf_name, :at => [904,535]
        end
        pdf
      end

  end
end
