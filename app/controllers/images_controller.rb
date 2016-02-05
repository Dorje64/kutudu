class ImagesController < ApplicationController
  def index
  end

  def new
  end

  def show
    @images=Image.where('post_id'=> params[:id]).where('image_content_type'=>"image/jpeg")

  end

  def pdf
    @pdf=Image.find(params[:id])
  end

  def create
    @post=Post.find(params[:post_id])
    @image = @post.images.new(image_params)
    @image.user_id = current_user.id
    @image.post_id = @post.id



    if @image.save
      #redirect_to :action => :show, :id => @image.id
      redirect_to post_path(@post), notice: 'File is uploaded.'
    else
      redirect_to post_path(@post), notice: 'This File cannot be uploaded.'
    end

  end


  private
  def image_params
    params.require(:image).permit(:image,:user_id,:post_id)
  end

end
