class PostsController < ApplicationController
  before_action :authenticate_usuario!, only: [:new, :edit, :destroy]
  load_and_authorize_resource param_method: :post_params
  skip_authorize_resource only: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_usuario.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
       redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit        
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private
    def post_params
      params.require(:post).permit(:titulo, :descripcion, :cuerpo)
    end
end
