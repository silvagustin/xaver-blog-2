class Public::PostsController < Public::PublicController
	before_action :set_post, only: :show

	def index
    @posts = Post.all
  end

  def show
    @post_anterior = Post.anterior(@post.id)
    @post_siguiente = Post.siguiente(@post.id)
  end

  private
    def set_post
    	@post = Post.find(params[:id])
    end
end
