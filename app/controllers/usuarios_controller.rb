class UsuariosController < ApplicationController
	def show
		@usuario = Usuario.find(params[:id])
		@posts = @usuario.posts
	end
end
