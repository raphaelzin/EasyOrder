class MenusController < ApplicationController
	def create
    	@menu = Menu.new(menu_params)
    	if @menu.save
      	flash[:success] = 'Menu added'
      	redirect_to admins_dishes_path
    	end
  	end

    def edit
      @menu = Menu.find(params[:id])
    end

    def update
      @menu = Menu.find(params[:id])
      if @menu.update_attributes(menu_params)
        @menu.save
        redirect_to admins_dishes_path
      else
        redirect_to :back
      end
    end

    def destroy
      @menu = Menu.find(params[:id])
      @manu.destroy
      redirect_to :back
    end

	def menu_params
    	params.require(:menu).permit(:language,:locale)
  	end
end
