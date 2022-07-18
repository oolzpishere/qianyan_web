module Frontend
  class ArticlesController < ApplicationController
    before_action :set_article, only: %i[ show ]

    # GET /articles
    def index
      @articles = Backend::Article.all
    end

    # GET /articles/1
    def show
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = Backend::Article.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def article_params
        params.fetch(:article, {})
      end
  end
end
