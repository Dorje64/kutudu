class PageController < ApplicationController

   before_filter :authenticate_user!

  def list

     @key= params[:group]
    #
    # @group=Group.find_by_groupname(@key)
    #
    #  if (!@group)
    #    @error= "not found"
    #  else
    #
    #    session[:groupname]= @group.groupname
    #    session[:group_id] = @group.id
    #    session[:admin] = @group.admin


     if (@key == 'done' && current_user.id == 1 )

     redirect_to group_path

    end
    # end
    end

  end

