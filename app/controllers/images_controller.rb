class ImagesController < ApplicationController
  def index
  end

  def new
  end

  def show
    @id = params[:id]
    @image = Image.find(@id)
  end

  def create
    @post=Post.find(params[:post_id])

    @image = @post.images.new(image_params)
    @image.user_id = current_user.id
    @image.post_id = @post.id
    if @image.save
     # redirect_to :action => :show, :id => @image.id
    end

  end


  private
  def image_params
    params.require(:image).permit(:image,:user_id,:post_id)
  end

end
