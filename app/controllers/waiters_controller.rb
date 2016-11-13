class WaitersController < ApplicationController
	
	def create
    	@waiter = Waiter.new(waiter_params)
    
    	if @waiter.save
      	flash[:success] = 'Employer added'
      	redirect_to admins_staff_path
    	end
  	end

    def edit
      @waiter = Waiter.find(params[:id])
    end

    def update
      @waiter = Waiter.find(params[:id])
      if @waiter.update_attributes(waiter_params)
        @waiter.save
        flash[:success] = "Employee successfully edited"
        redirect_to waiters_manage_employees_path
      else
        render :edit
      end
    end

  	def login
  		reset_session
  	end

  	def tables
  		@tables = Table.all
  	end
    
    def destroy
      @waiter = Waiter.find(params[:id])
      @waiter.destroy
      redirect_to :back
    end

	def waiter_params
    	params.require(:waiter).permit(:name, :cpf, :phone, :password)
  	end
end
