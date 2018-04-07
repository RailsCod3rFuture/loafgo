class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, if: :verify_api
  before_action :devise_parameter_sanitizer, if: :devise_controller?

  class Client::ParameterSanitizer < Devise::ParameterSanitizer
    def initialize(*)
      super
      permit(:sign_up, keys: %i[email full_name company state telephone zip_code password password_confirmation token])
    end
  end

  class Manager::ParameterSanitizer < Devise::ParameterSanitizer
    def initialize(*)
      super
      permit(:sign_up, keys: %i[email full_name contact_number password password_confirmation token])
    end
  end

  private

  def verify_api
    params[:controller].split('/')[0] != 'devise_token_auth'
  end

  protected

  def devise_parameter_sanitizer
    if resource_class == Client
      Client::ParameterSanitizer.new(Client, :client, params)
    elsif resource_class == Manager
      Manager::ParameterSanitizer.new(Manager, :manager, params)
    else
      super
    end
  end
end
