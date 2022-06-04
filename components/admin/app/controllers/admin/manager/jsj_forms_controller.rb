module Admin
  class Manager::JsjFormsController < Manager::ApplicationController
    before_action :set_manager_jsj_form, only: %i[ show edit update destroy ]

    # GET /manager/jsj_forms
    def index
      @jsj_forms = Backend::JsjForm.all
    end

    # GET /manager/jsj_forms/1
    def show
    end

    # GET /manager/jsj_forms/new
    def new
      @manager_jsj_form = Manager::JsjForm.new
    end

    # GET /manager/jsj_forms/1/edit
    def edit
    end

    # POST /manager/jsj_forms
    def create
      @manager_jsj_form = Manager::JsjForm.new(manager_jsj_form_params)

      if @manager_jsj_form.save
        redirect_to @manager_jsj_form, notice: "Jsj form was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /manager/jsj_forms/1
    def update
      if @manager_jsj_form.update(manager_jsj_form_params)
        redirect_to @manager_jsj_form, notice: "Jsj form was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /manager/jsj_forms/1
    def destroy
      @manager_jsj_form.destroy
      redirect_to manager_jsj_forms_url, notice: "Jsj form was successfully destroyed."
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_manager_jsj_form
        @jsj_form = Backend::JsjForm.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def manager_jsj_form_params
        params.fetch(:manager_jsj_form, {})
      end
  end
end
