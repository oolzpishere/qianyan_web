module Jsj
  module RenderPdfs

    def self.render_location 
      @@render_location ||= "/Users/leeli/Downloads/pdfs"
    end

    def self.assets_path
      @@assets_path ||= Rails.root.join('app', 'assets')
    end

    def self.public_path
      @@public_path ||= Rails.root.join('public')
    end

    def self.font_path
      @@font_path ||= public_path.join('fonts')
    end

  end
end
