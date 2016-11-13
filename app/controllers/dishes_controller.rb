class DishesController < ApplicationController
	before_action :lookup_category

	def create
		@dish = Dish.new(dish_params)
		if @dish.save
			redirect_to admins_menu_path
		end
	end

	def lookup_category
	  @category = Category.find(params[:category_id])
	end

	def update
		@dish = Dish.find(params[:id])
		if @dish.update_attributes(dish_params)
			@dish.save
			redirect_to admins_menu_path
		else
			redirect_to :back
		end
	end

	def edit
		@dish = Dish.find(params[:id])
		@category = Category.find(params[:category_id])
	end

	def destroy
	    @dish = Dish.find(params[:id])
	    flash[:success] = 'Dish successfully removed!'
	    @dish.destroy
	    redirect_to :back
  	end

	def dish_params
		params.require(:dish).permit(:title,:price,:description,:observation,:category_id)
	end
end
