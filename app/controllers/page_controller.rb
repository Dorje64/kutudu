class PageController < ApplicationController

   before_filter :authenticate_user!

  def list

     @key= params[:group]

     if (@key == 'done' && current_user.id == 1 )

     redirect_to group_path

    end
    # end
    end

  end

