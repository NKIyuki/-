class ApplicationController < ActionController::Base

protected
    def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
            devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
            devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email])
    end

end
