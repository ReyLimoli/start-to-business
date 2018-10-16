class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    keys = %i[name document linkedin birth_day amount_available_to_invest
              user_type]
    devise_parameter_sanitizer.permit(:sign_up, keys: keys)
  end
end
