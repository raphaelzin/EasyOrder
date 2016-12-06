class WaitersController < ApplicationController
	
	def create
    	@waiter = Waiter.new(waiter_params)
    
    	if @waiter.save
      	flash[:success] = t(:waiter_added)
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
        flash[:success] = t(:waiter_edited)
        redirect_to waiters_manage_employees_path
      else
        render :edit
      end
    end

  	def login
  		reset_session
  	end

  	def tables
      non_waiter_redirect
  		@tables = Table.order("number asc")
      session[:client_id] = nil
      session[:table_id] = nil
  	end

    def tables_calling
      calling = []
      @tables = Table.all
      @tables.where(requested: true).each do |table|
        calling << table.id
      end
      render json: calling
    end

    def clients_checking_out
      checking_out = []
      Table.all.each do |t|
        t.clients.each do |c|
          if c.payment_method.present? and not c.done
            checking_out << t.id
          end
        end
      end
      render json: checking_out
    end
    
    def destroy
      @waiter = Waiter.find(params[:id])
      @waiter.destroy
      respond_to do |format|
        format.html { redirect_to :back }
        format.json { head :no_content }
        format.js   { render :layout => false }
     end
      # flash[:success] = t(:waiter_destroyed)
      # redirect_to :back
    end

    def non_waiter_redirect
      if not current_waiter.present? and not current_admin.present?
        redirect_to root_path
      end
    end

	  def waiter_params
    	params.require(:waiter).permit(:name, :cpf, :phone, :password)
  	end
end
