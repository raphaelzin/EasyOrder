class UsersController < ApplicationController
	
	def add_dish
	    flash[:success] = "Dish - wait for it -  Ordered!"
	    @client = Client.find(session[:client_id])
	    @dish = Dish.find(params[:dish_id])
	    @client.dishes << @dish
	    @client.save
	    redirect_to table_client_path(@client.table,@client)
  	end
end
