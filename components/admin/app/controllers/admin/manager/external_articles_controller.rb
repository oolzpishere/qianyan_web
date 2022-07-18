module Admin
  class Manager::ExternalArticlesController < Manager::ApplicationController
    before_action :set_manager_external_article, only: %i[ show edit update destroy ]

    # GET /manager/external_articles
    def index
      @external_articles = Backend::ExternalArticle.all
    end

    # GET /manager/external_articles/1
    def show
    end

    # GET /manager/external_articles/new
    def new
      @external_article = Backend::ExternalArticle.new
    end

    # GET /manager/external_articles/1/edit
    def edit
    end

    # POST /manager/external_articles
    def create
      _external_article_params = external_article_params
      article_tags_params = _external_article_params.delete(:article_tags)

      @external_article = Backend::ExternalArticle.new(_external_article_params)

      if @external_article.save
        ::Admin::UpdateArticleTagsService::Base.new(@external_article, article_tags_params).update
        
        redirect_to manager_external_articles_path(@external_article), notice: "External article was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /manager/external_articles/1
    def update
      _external_article_params = external_article_params
      article_tags_params = _external_article_params.delete(:article_tags)
      
      ::Admin::UpdateArticleTagsService::Base.new(@external_article, article_tags_params).update

      if @external_article.update(_external_article_params)
        redirect_to manager_external_articles_path(@external_article), notice: "External article was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /manager/external_articles/1
    def destroy
      @external_article.destroy
      redirect_to manager_external_articles_url, notice: "External article was successfully destroyed."
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_manager_external_article
        @external_article = Backend::ExternalArticle.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def external_article_params
        params.fetch(:external_article, {}).permit(:title, :author, :source_url, article_tags: [])
      end
  end
end
