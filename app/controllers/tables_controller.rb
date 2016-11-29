class TablesController < ApplicationController

  # def index
  #   @tables = Table.all
  #   respond_to do |format|
  #     format.html
  #     format.json { render :json => @tables.to_json }
  #   end
  # end 

  def welcome
    if current_client.present? and current_table.present?
      redirect_to tables_home_path
    end
  end

  def redirect_to_table
		@table = Table.find_by(:code => params[:code])

		if @table.present?
      if current_client.present?
        @client = current_client
        @client.table = @table
        @client.done = false
        @client.payment_method = nil
        @client.save
      end
			session[:table_id] = @table.id
      flash[:success] = "#{t(:welcome_to_table)} #{@table.number}"
			redirect_to tables_home_path
		else
			flash[:error] = t(:incorrect_code)
			redirect_to root_path
		end
	end

  

  def home
  	@new = Client.new
    if not current_table.present?
      session[:table_id] = params[:id]
    end

    if current_client.present?
      if not current_client.table.present?
        reset_session
        redirect_to root_path
      end
    end
  end

  def edit
    @table = Table.find(params[:id])
  end

  def create
  	@table = Table.new(table_params)
    begin
    	if @table.save!
        flash[:success] = t(:table_created)
    		redirect_to admins_tables_path
    	end
      rescue ActiveRecord::RecordInvalid => e
        if e.message == "Validation failed: Number has already been taken"
          flash[:error] = t(:unique_table)
          redirect_to admins_tables_path
        end
    end
  end

  def update
    @table = Table.find(params[:id])
    if @table.update_attributes(table_params)
      @table.save
      flash[:success] = t(:table_edited)
      redirect_to admins_tables_path
    else
      redirect_to :back
    end
  end

  def finish_table
    @table = Table.find(params[:table_id])
    done = true
    @order = Order.new

    @table.clients.each do |c|
      if !c.done
        done = false
        flash[:error] = t(:not_done_finish)
        redirect_to :back
      end
    end

    if done
      @table.clients.each do |c|
        c.dishes.each do |d|
          @order.dishes << d
        end
        c.dishes = []
        flash[:success] = t(:table_finished)
      end

      if @order.bill_value > 0
        @order.waiter = @table.waiter
        @order.client = @table.clients.first
        @order.save!
      end

      @table.clients = []
      @table.requested = false
      # Generate a random word with 8 characters
      o = [('1'..'9'),('a'..'z')].map { |i| i.to_a }.flatten
      @table.code = (0...8).map { o[rand(o.length)] }.join
      # End

      @table.save
      redirect_to waiters_tables_path
    end
  end 

  def toggle_request
    @table = Table.find(params[:table_id])
    @table.requested = !@table.requested
    @table.save
    redirect_to :back
  end

  def destroy
    @table = Table.find(params[:id])
    @table.destroy
    flash[:success] = t(:table_destroyed)
    redirect_to :back
  end


  def table_params
  	params.require(:table).permit(:id, :code, :number, :waiter_id, :requested)
  end 

end
