class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  alias_method :current_user, :current_usuario

  rescue_from CanCan::AccessDenied do |exception|
  	if current_usuario.present?
  	 redirect_to admin_root_path
  	else
  		redirect_to public_root_path
  	end    
  end

  def after_sign_in_path_for(resource)
  	request.env['omniauth.origin'] || stored_location_for(resource) || admin_root_path
  end
end
