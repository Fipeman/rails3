class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :http_basic_authenticate
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image_url])
  end
 

  # def http_basic_authenticate
  #   authenticate_or_request_with_http_basic do |name, password|
  #     name == "1234" && password == "1234"
  #   end
  # end

end
