# frozen_string_literal: true

class Clients::SessionsController < Devise::SessionsController


  protected

  def after_sign_in_path_for(resource)
    client_dashboard_index_path(resource)
  end
end
