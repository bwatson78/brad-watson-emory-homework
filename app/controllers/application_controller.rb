class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def home
    render :home
  end

  protected

  def configure_permitted_parameters
    attributes = [
      :first_name,
      :middle_name,
      :last_name,
      :home_town,
      :home_state,
      :dob
    ]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
