module ApplicationHelper
  def parent_layout(layout)
    @view_flow.set(:layout, output_buffer)
    output = render(:file => "layouts/#{layout}")
    self.output_buffer = ActionView::OutputBuffer.new(output)
  end

  # Posts #####################################################################
	def fecha_de_publicacion(post)
		l post.created_at, format: :custom
	end
end
