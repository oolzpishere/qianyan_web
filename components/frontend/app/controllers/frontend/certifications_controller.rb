module Frontend
  class CertificationsController < ApplicationController
    # before_action :set_certification, only: %i[ show edit update destroy ]
    include ActionView::Helpers::AssetUrlHelper
    # GET /certification_pdfs
    def index
      @certification_pdfs = CertificationPdf.all
    end

    def search

    end

    def search_datum
      puts "params!! #{params}"
      phone = params[:phone]
      name = params[:name]
      attend_data = Backend::AttendDatum.where(phone: phone)
      if !attend_data.blank?
        puts attend_data.inspect
      end
      if attend_data.blank?
        redirect_to frontend.certifications_search_path, notice: "未找到您的报名信息，请重新查询"
      else
        # todo: if have result, redirect to print pdf page
        attend_data_ids = attend_data.map(&:id).to_json
        _path = certifications_results_path + "?attend_data_ids=#{attend_data_ids}"
        redirect_to _path
      end
      # or show search result below.
      # click to print pdf, or download pdf.
    end

    def results 
      attend_data_ids = params[:attend_data_ids] 
      if attend_data_ids.blank?
        redirect_to frontend.certifications_search_path
        return
      end
      attend_data_ids = JSON.parse(attend_data_ids)
      @attend_data = Backend::AttendDatum.where(id: attend_data_ids)
        
    end

    # GET /certification_pdfs/1
    def show
      respond_to do |format|
        format.html
        format.pdf do
          # image = MiniMagick::Image.open("certs/nation.jpg")
          assets_path = Rails.root.join('app', 'assets')
          public_path = Rails.root.join('public')
          backgroud_image = assets_path.join('images', 'certs', 'nation.jpg')
          pdf = Prawn::Document.new(page_size: [800, 594], 
                                    page_layout: :portrait,
                                    background:  backgroud_image)
          # pdf.image(app.asset_path("ccerts/nation.jpgerts/nation.jpg"), width: pdf.bounds.width, height: pdf.bounds.height)

          pdf.font("#{public_path}/fonts/Songti.ttc", size: 16) do
            pdf.stroke_axis
            pdf.move_down 150 

            pdf.draw_text("测试" + " " * 30 + "2022年5月30日" , at: [130,360])

            pdf.move_down 25
            pdf.draw_text "小学数学", :at => [100,325]
            pdf.draw_text "小学数学", :at => [550,325]
          end

          # send_data pdf.render_file,  filename: pdf.name, type: "application/pdf"
          # pdf.render_file 'assignment.pdf'
          send_data pdf.render,  filename: 'test.pdf', type: 'application/pdf', disposition: 'inline'
        end
      end
    end

    # GET /certification_pdfs/new
    def new
      @certification_pdf = CertificationPdf.new
    end

    # GET /certification_pdfs/1/edit
    def edit
    end

    # POST /certification_pdfs
    def create
      @certification_pdf = CertificationPdf.new(certification_pdf_params)

      if @certification_pdf.save
        redirect_to @certification_pdf, notice: "Certification pdf was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /certification_pdfs/1
    def update
      if @certification_pdf.update(certification_pdf_params)
        redirect_to @certification_pdf, notice: "Certification pdf was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /certification_pdfs/1
    def destroy
      @certification_pdf.destroy
      redirect_to certification_pdfs_url, notice: "Certification pdf was successfully destroyed."
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      # def set_certification
      #   @certification_pdf = CertificationPdf.find(params[:id])
      # end

      # Only allow a list of trusted parameters through.
      def certification_pdf_params
        params.fetch(:certification_pdf, {})
      end
  end
end
