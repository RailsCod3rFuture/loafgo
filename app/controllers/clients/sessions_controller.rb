# frozen_string_literal: true

class Clients::SessionsController < Devise::SessionsController


  protected
  def after_sign_in_path_for(resource)
    client_dashboard_path(resource)
  end

  def after_sign_out_path_for(resource_or_scope)
    root_url
  end
end
