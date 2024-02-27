class ApplicationController < ActionController::Base
    layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :safety_manager
      'safety_manager_layout'
    else
      'application'
    end
  end
end
