module Admin
  class Manager::ApplicationController < ::Admin::ApplicationController

    before_action :authenticate_manager
    # before_action :store_location, :only => [:edit]

    private

      def authenticate_manager
        # admin_signed_in? and current_admin is admin
        unless admin_signed_in? && (current_admin.role == "admin")
          sign_out :admin
          redirect_to account.new_admin_session_path, notice: "请使用admin账户访问该页面"
        end
      end

  end
end
