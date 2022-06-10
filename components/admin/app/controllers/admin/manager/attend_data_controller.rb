module Admin
  class Manager::AttendDataController < Manager::ApplicationController
    before_action :set_manager_attend_datum, only: %i[ show edit update destroy ]

    def select
      @conferences = Backend::Conference.all
      @jsj_forms = Backend::JsjForm.all
    end

    # GET /manager/attend_data
    def index
      jsj_form_id = params[:jsj_forms]
      @attend_data = Backend::AttendDatum.includes(:jsj_form).where({ jsj_form_id: jsj_form_id }).order(:jsj_id)
    end

    # GET /manager/attend_data/1
    def show
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
