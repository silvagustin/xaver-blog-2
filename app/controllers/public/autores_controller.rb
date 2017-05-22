class Public::AutoresController < Public::PublicController
	def show
		@usuario = Usuario.find(params[:id])
		@posts = @usuario.posts
	end
end