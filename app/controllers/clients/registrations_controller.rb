# frozen_string_literal: true

class Clients::RegistrationsController < Devise::RegistrationsController

  protected
  def after_sign_up_path_for(resource)
    client_dashboard_path
  end
end
