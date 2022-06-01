module Admin
  class Manager::ConferencesController < Manager::ApplicationController
    before_action :set_manager_conference, only: %i[ show edit update destroy ]

    # GET /manager/conferences
    def index
      @conferences = Backend::Conference.all
    end

    # GET /manager/conferences/1
    def show
    end

    # GET /manager/conferences/new
    def new
      @manager_conference = Manager::Conference.new
    end

    # GET /manager/conferences/1/edit
    def edit
    end

    # POST /manager/conferences
    def create
      @manager_conference = Manager::Conference.new(manager_conference_params)

      if @manager_conference.save
        redirect_to @manager_conference, notice: "Conference was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /manager/conferences/1
    def update
      if @manager_conference.update(manager_conference_params)
        redirect_to @manager_conference, notice: "Conference was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /manager/conferences/1
    def destroy
      @manager_conference.destroy
      redirect_to manager_conferences_url, notice: "Conference was successfully destroyed."
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_manager_conference
        @manager_conference = Manager::Conference.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def manager_conference_params
        params.fetch(:manager_conference, {})
      end
  end
end
