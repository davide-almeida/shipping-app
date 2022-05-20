class ApplicationController < ActionController::Base
    layout :layout_by_resource
    
    before_action :configure_permitted_parameters, if: :devise_controller? and :resource_name == :user

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname])
    end

    private
    def layout_by_resource
        if devise_controller? && resource_name == :admin
            "app_devise"
        elsif devise_controller? && resource_name == :user
            "shipping_company_devise"
        else
            "application"
        end
    end
end
