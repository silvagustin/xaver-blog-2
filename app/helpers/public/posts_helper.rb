module Public::PostsHelper
	def fecha_de_publicacion(post)
		l post.created_at, format: :custom
	end
end
