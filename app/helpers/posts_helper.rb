module PostsHelper
	def creado_el(un_post)
		un_post.created_at.strftime("%d/%M/%Y %H:%M")
	end
end
