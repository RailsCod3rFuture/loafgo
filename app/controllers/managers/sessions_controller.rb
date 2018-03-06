# frozen_string_literal: true

class Managers::SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    manager_dashboard_index_path(resource)
  end
end
