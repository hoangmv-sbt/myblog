class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters    
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birthday, :address])
  end

  private

  def user_not_authorized
    flash[:alert] = "You do not have permission to perform this action."
    redirect_to(request.referrer || root_path)
  end

end
