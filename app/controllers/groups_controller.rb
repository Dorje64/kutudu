class GroupsController < ApplicationController
  before_filter :authenticate_user!
  #before_filter :admin_authenticate
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  #before_filter :admin_authenticate!

  # GET /groups
  # GET /groups.json

    def admin_authenticate
      redirect_to (root_path) if current_user.username!="Dorje"
    end



  def index
    if ( current_user.username!="Torchi" )
      redirect_to(root_path)
    else
    @groups = Group.all
      end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    if ( current_user.username!="Torchi" )
      redirect_to(root_path)
    end
  end

  # GET /groups/new
  def new
          if ( current_user.username="Torchi" )
            redirect_to(root_path)
            end
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:groupname, :admin, :count)
    end
end
