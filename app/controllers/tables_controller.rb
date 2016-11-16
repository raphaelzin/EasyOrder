class TablesController < ApplicationController
  def welcome
    # reset_session
  end

  def redirect_to_table
		@table = Table.find_by(:code => params[:code])

		if @table.present?
      if current_client.present?
        @client = current_client
        @client.table = @table
        @client.save
      end
			session[:table_id] = @table.id
      flash[:success] = "Welcome to table #{@table.number}"
			redirect_to tables_home_path
		else
			flash[:error] = "Incorrect code!"
			redirect_to root_path
		end
	end

  

  def home
  	@new = Client.new
    if not current_table.present?
      session[:table_id] = params[:id]
    end

    if current_client.present?
      if current_table != current_client.table
        redirect_to tables_home_path
      end
    end
  end

  def edit
    @table = Table.find(params[:id])
  end

  def create
  	@table = Table.new(table_params)
  	if @table.save
  		#flash
  		redirect_to admins_tables_path
  	end
  end

  def update
    @table = Table.find(params[:id])
    if @table.update_attributes(table_params)
      @table.save
      redirect_to admins_tables_path
    else
      redirect_to :back
    end
  end

  def toggle_request
    @table = Table.find(params[:table_id])
    @table.requested = !@table.requested
    @table.save
    redirect_to :back
  end

  def destroy
    @table = Table.find(table_params[:id])
    @table.destroy
    redirect_to :back
  end

  def table_params
  	params.require(:table).permit(:code,:number,:waiter_id)
  end 

end
