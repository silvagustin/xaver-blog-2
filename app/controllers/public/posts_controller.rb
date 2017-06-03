class Public::PostsController < Public::PublicController
	before_action :set_post, only: :show

  load_resource :usuario
  load_resource :post, through: :usuario, shallow: true

	def index
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
