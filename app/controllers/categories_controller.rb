class CategoriesController < ApplicationController
	def create
  	@category = Category.new(category_params)
  	if @category.save
    	flash[:success] = t(:category_added)
    	redirect_to admins_categories_path
  	end
	end

    def edit
      @menu = Menu.find(params[:menu_id])
      @category = Category.find(params[:id])
    end

    def update
      @menu = Menu.find(params[:menu_id])
      @category = Category.find(params[:id])
      if @category.update_attributes(category_params)
        @category.save
        redirect_to admins_categories_path
      else
        redirect_to :back
      end
    end

    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      redirect_to :back
    end

	def category_params
    	params.require(:category).permit(:name, :description, :menu_id)
  	end
end
