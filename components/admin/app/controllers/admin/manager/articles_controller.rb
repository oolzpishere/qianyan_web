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
      _article_params = article_params
      article_tags_params = _article_params.delete(:articles_article_tags)
      @article = Backend::Article.new(_article_params)

      if @article.save
        update_article_tags(@article, article_tags_params)

        redirect_to manager_articles_path(@article), notice: "Article was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /manager/articles/1
    def update
      _article_params = article_params
      article_tags_params = _article_params.delete(:articles_article_tags)
      
      update_article_tags(@article, article_tags_params)

      if @article.update(_article_params)
        redirect_to manager_article_path(@article), notice: "Article was successfully updated."
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
        params.fetch(:article, {}).permit(:title, :content, :author, :source_url, articles_article_tags: [])
      end

      def update_article_tags(article, article_tags_params)
        article_tags = parse_article_tags_params(article_tags_params)

        # compare with db
        # if difference, 
        unless @article.article_tags.map(&:id).sort == article_tags.sort
          # delete all article tags
          @article.article_tags.delete_all
          return if article_tags.blank?

          # add new article tags
          article_tags.each do |tag_id|
            @article.articles_article_tags.create(article_tag_id: tag_id)
          end
        end
      end

      def parse_article_tags_params(article_tags_params)
        article_tags_params.delete_if {|tag| tag.blank? }
        article_tags_params.map(&:to_i)
      end

  end
end
