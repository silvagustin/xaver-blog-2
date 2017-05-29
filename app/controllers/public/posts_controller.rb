class Public::PostsController < Public::PublicController
	before_action :set_post, only: :show

	def index
    @posts = Usuario.find(params[:usuario_id]).posts || Post.all
  end

  def show
    @post_anterior = @post.anterior
    @post_siguiente = @post.siguiente
  end

  private
    def set_post
    	@post = Post.find(params[:id])
    end
end
