class Public::PostsController < Public::PublicController
	before_action :set_post, only: :show

	def index
    #@posts = Usuario.find(params[:id]).posts || Post.all
    @posts = params[:id].nil? ? Post.all : Usuario.find(params[:id]).posts
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
