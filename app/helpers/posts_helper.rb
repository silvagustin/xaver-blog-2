module PostsHelper
	def creado_el
		self.class.created_at.strftime("%F%T")
	end
end
