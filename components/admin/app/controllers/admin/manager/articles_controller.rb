module Admin
  class Manager::ArticlesController < Manager::ApplicationController
    before_action :set_article, only: %i[ show edit update destroy ]

    # GET /manager/articles
    def index
      @articles = Backend::Article.all
    end

    # GET /manager/articles/1
    def show
    end

    # GET /manager/articles/new
    def new
      @article = Backend::Article.new
    end

    # GET /manager/articles/1/edit
    def edit
    end

    # POST /manager/articles
    def create
      @article = Backend::Article.new(article_params)

      if @article.save
        redirect_to manager_articles_path(@article), notice: "Article was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /manager/articles/1
    def update
      if @article.update(article_params)
        redirect_to @article, notice: "Article was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /manager/articles/1
    def destroy
      @article.destroy
      redirect_to manager_articles_url, notice: "Article was successfully destroyed."
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = Backend::Article.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def article_params
        params.fetch(:article, {}).permit(:title, :content, :author, :source_url)
      end
  end
end
