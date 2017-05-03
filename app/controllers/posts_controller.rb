class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  #protect_from_forgery prepend: true
  before_action :authenticate_usuario!, only: [:new, :edit, :destroy]

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
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:titulo, :descripcion, :cuerpo)
    end
end
