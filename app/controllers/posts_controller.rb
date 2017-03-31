
class PostsController < ApplicationController

  before_filter :authenticate_user!  #except:  [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    #if(user_signed_in?)
    page=params[:page]
    @sort = params[:sort]
    @done=Done.new()
    @group = Group.find(group_id)

    @members = User.where('group_id' => group_id).count

    if (!@sort)
      @posts = Post.where('group_id' => group_id).order('deadline').page(page)
    else
      @posts = Post.where('title' => @sort ).where('group_id' => group_id)
                                        .order('deadline').page(page)

    @pdf=Image.where("image_content_type"=>"application/pdf")
  end

# GET /posts/1
  # GET /posts/1.json


  def show
    @comment=Comment.new
    @image=Image.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

#   # GET /posts/1/edit
   def edit

     @group = Group.find(group_id)
  if @group.admin != current_user.username
     redirect_to(root_path)
   end
   end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.group_id = group_id
    @post.username = current_user.username
   # @post.save
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @group = Group.find(group_id)
    if @group.admin != current_user.username
      redirect_to(root_path)
    else

 if @post.comments.each do |comment|
    comment.destroy
 end
   end

 if  @post.dones.each do |done|
     done.destroy
 end

 end

 if  @post.images.each do |image|
   image.destroy
 end
end

   if (@post.destroy)
   respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully deleted.' }
      format.json { head :no_content }
      end
 else
   respond_to do |format|
     format.html { redirect_to posts_url, notice: 'all the comments and done are deleted, try again to' }
     format.json { head :no_content }
   end
 end

      end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def group_id
      group_id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :no, :course, :deadline, :details, :user_id )
    end
end
