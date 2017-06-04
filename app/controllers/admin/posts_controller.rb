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
    @post.build_image
  end

  def create
    @post = current_usuario.posts.build(post_params)
    @post.image ||= nil
    #upload_image

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
      #params.require(:post).permit(:titulo, :descripcion, :cuerpo)
      #params.require(:post).permit(:titulo, :descripcion, :cuerpo, image_attributes: [])
      params.require(:post).permit!
    end

    def upload_image      
       # get the file_type that have been uploaded
       file_type = params[:post][:image].content_type

       # check the file type for images
       if file_type == 'image/jpeg' || file_type == 'image/jpg' || file_type == 'image/png' || file_type == 'image/gif' || file_type == 'image/bmp'

          # as per the file type give the images name
          case file_type
             when "image/jpeg"
                file_name = "pic_#{Time.now.strftime("%Y%m%d%H%M%S")}.jpg"
             when "image/png"
                file_name = "pic_#{Time.now.strftime("%Y%m%d%H%M%S")}.png"
             when "image/gif"
                file_name = "pic_#{Time.now.strftime("%Y%m%d%H%M%S")}.gif"
             when "image/bmp"
                file_name = "pic_#{Time.now.strftime("%Y%m%d%H%M%S")}.bmp"
          end
     
          # give the file path for image
          file_path = File.join(Rails.root, 'public', 'images', 'upload_images', file_name)

          # copy the image from the uploaded one to file_path
          File.open(file_path, 'wb') do |f|
                f.write params[:post][:image].read
          end

          #
          @image.image_name = file_name
          @image.image_type = file_type
       else
          @image = nil
       end
    end

end
