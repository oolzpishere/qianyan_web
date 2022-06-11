module Frontend
  class Navs 
    
    attr_reader :navs
    def initialize(current_path, current_controller, navs)
      @navs = navs
      add_active(current_path, current_controller)
    end

    def add_active(current_path, current_controller)
      navs.each do |nav|
        if nav[:path] == "/" 
          nav[:active] = true if current_path == "/"
        elsif current_controller == nav[:controller]
          nav[:active] = true
        elsif current_path.match(nav[:path])
          nav[:active] = true  
        end
      end
    end

  end
end