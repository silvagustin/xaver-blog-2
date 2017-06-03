class Public::PostsController < Public::PublicController
	before_action :set_post, only: :show

  load_resource :usuario
  load_resource :post, through: :usuario, shallow: true

	def index
    posts_recientes unless params[:posts_antiguos]
  end

  def show
    @post_anterior = @post.anterior
    @post_siguiente = @post.siguiente
  end

  private
    def set_post
    	@post = Post.find(params[:id])
    end

    def posts_recientes
      @posts = @posts.limit(3)
    end
end
