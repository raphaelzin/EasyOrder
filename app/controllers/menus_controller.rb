class MenusController < ApplicationController
	def create
    	@menu = Menu.new(menu_params)
      @menu.locale = @menu.locale.downcase
    	if @menu.save
      	flash[:success] = t(:menu_added)
      	redirect_to admins_menu_path
    	end
  	end

    def edit
      @menu = Menu.find(params[:id])
    end

    def update
      @menu = Menu.find(params[:id])
      if @menu.update_attributes(menu_params)
        @menu.locale = @menu.locale.downcase
        @menu.save
        flash[:success] = t(:menu_edited)
        redirect_to admins_menu_path
      else
        redirect_to :back
      end
    end

    def destroy
      @menu = Menu.find(params[:id])
      flash[:success] = t(:menu_destroyed)
      @menu.destroy
      redirect_to :back
    end

	def menu_params
    	params.require(:menu).permit(:language,:locale)
  	end
end
