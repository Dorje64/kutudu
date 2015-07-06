class DonesController < ApplicationController
  before_action :set_done, only: [:show, :edit, :update, :destroy]


  # POST /dones
  # POST /dones.json
  def create
#    @done = Done.new(done_params)

    @post = Post.find(params[:post_id])
    @done = @post.dones.new(done_params)
    @done.user_id = current_user.id


    respond_to do |format|
      if @done.save
        format.html { redirect_to posts_path, notice: 'Done was successfully created.' }
        format.json { render :show, status: :created, location: @done }
      else
        format.html { render :new }
        format.json { render json: @done.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dones/1
  # PATCH/PUT /dones/1.json
  def update
    respond_to do |format|
      if @done.update(done_params)
        format.html { redirect_to @done, notice: 'Done was successfully updated.' }
        format.json { render :show, status: :ok, location: @done }
      else
        format.html { render :edit }
        format.json { render json: @done.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dones/1
  # DELETE /dones/1.json
  def destroy
    @done.destroy
    respond_to do |format|
      format.html { redirect_to dones_url, notice: 'Done was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_done
      @done = Done.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def done_params
      params.require(:done).permit(:user_id, :post_id)
    end
end
