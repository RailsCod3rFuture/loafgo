class Managers::SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    manager_dashboard_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_url
  end
end
