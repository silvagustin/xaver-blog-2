class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  alias_method :current_user, :current_usuario

  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to posts_path
  end
end
