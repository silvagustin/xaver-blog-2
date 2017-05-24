class Admin::PostsController < Admin::AdminController	
  load_and_authorize_resource param_method: :post_params
  
  def index
    @usuario = current_usuario
    @posts = current_usuario.posts
  end

  def show
  end

	def new
    @post = Post.new
  end

  def create
    @post = current_usuario.posts.build(post_params)

    if @post.save
      redirect_to admin_post_path(@post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
       redirect_to admin_post_path(@post), notice: 'Post was successfully updated.'
    else
      render :edit        
    end
  end

  def destroy
    @post.destroy
    redirect_to :admin_posts
  end

  private
    def post_params
      params.require(:post).permit(:titulo, :descripcion, :cuerpo)
    end
end
