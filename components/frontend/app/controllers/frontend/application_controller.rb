module Frontend
  class ApplicationController < ActionController::Base
    before_action :init_navs
    def init_navs
      _navs = [
        {name: "首页", path: frontend.root_path, classes: "" },
        {name: "前沿资讯", path: frontend.articles_path, classes: ""},
        {name: "学时证明", path: frontend.certifications_search_path, controller: "certifications", classes: ""},
        {name: "成果评比", path: "/pingbi", classes: ""},
        {name: "教研会议", path: "/conferences", classes: ""},
        {name: "关于我们", path: "/corp", classes: ""},
      ]

      @navs_inst = Frontend::Navs.new(request.path, request.controller_class.controller_name, _navs)
      @navs = @navs_inst.navs
    end
  end
end
