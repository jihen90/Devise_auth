class ApplicationController < ActionController::Base
    before_action :sign_up_config, if: :devise_controller?
    before_action :user_update_config, if: :devise_controller?

    protected

    def sign_up_config
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    def user_update_config
        devise_parameter_sanitizer.permit(:account_update, keys: [:admin, :name])
    end

    def authorize_admin!
        redirect_to root_path unless current_user.admin
    end

end
