class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  alias_method :current_user, :current_usuario

  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to posts_path
  end

  def after_sign_in_path_for(resource)
  	request.env['omniauth.origin'] || stored_location_for(resource) || admin_posts_path
  end
end
