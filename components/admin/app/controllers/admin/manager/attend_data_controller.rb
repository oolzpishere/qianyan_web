module Admin
  class Manager::AttendDataController < Manager::ApplicationController
    before_action :set_manager_attend_datum, only: %i[ show edit update destroy ]

    def select
      @conferences = Backend::Conference.all
      @jsj_forms = Backend::JsjForm.all
    end

    # GET /manager/attend_data
    def index
      form_id = params[:form_id]
      form_type = params[:form_type]
      unless ["jsj_form", "form"].include?(form_type)
        redirect_to attend_data_select_path, alert: "form_type: #{form_type} is invalid."
      end

      @attend_data = Backend::AttendDatum.includes(:jsj_form, :form).where({ "#{form_type}_id" => form_id }).order(id: :desc)
    end

    # GET /manager/attend_data/1
    def show
    end

    def update_datum
      return unless params[:id].to_s.match(/^\d+$/)
      Jsj::PullData::PullDatum.new( params[:id] ).update_to_db
      redirect_to request.referer
    end

    # GET /manager/attend_data/new
    def new
      @manager_attend_datum = Manager::AttendDatum.new
    end

    # GET /manager/attend_data/1/edit
    def edit
    end

    # POST /manager/attend_data
    def create
      @manager_attend_datum = Manager::AttendDatum.new(manager_attend_datum_params)

      if @manager_attend_datum.save
        redirect_to @manager_attend_datum, notice: "Attend datum was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /manager/attend_data/1
    def update
      if @manager_attend_datum.update(manager_attend_datum_params)
        redirect_to @manager_attend_datum, notice: "Attend datum was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /manager/attend_data/1
    def destroy
      @manager_attend_datum.destroy
      redirect_to manager_attend_data_url, notice: "Attend datum was successfully destroyed."
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_manager_attend_datum
        @attend_datum = Backend::AttendDatum.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def manager_attend_datum_params
        params.fetch(:manager_attend_datum, {})
      end
  end
end
