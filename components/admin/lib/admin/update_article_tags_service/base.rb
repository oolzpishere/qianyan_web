module Admin
  module UpdateArticleTagsService
    class Base
      attr_reader :article, :article_tags_params
      def initialize(article, article_tags_params)
        @article = article
        @article_tags_params = article_tags_params
      end


      def update
        article_tags = parse_article_tags_params(article_tags_params)
        return if article_tags.blank?

        # compare with db
        # if difference, 
        unless article.article_tags.map(&:id).sort == article_tags.sort
          # delete all article tags
          article.article_tags.present? && article.article_tags.delete_all

          # add new article tags
          article_tags.each do |tag_id|
            article.articles_article_tags.create(article_tag_id: tag_id)
          end
        end
      end

      private

      def parse_article_tags_params(article_tags_params)
        article_tags_params.delete_if {|tag| tag.blank? }
        article_tags_params.map(&:to_i)
      end


    end
  end
end
