class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_table, :current_client, :current_waiter, :current_admin

  def current_table
  	if session.key?(:table_id)
      Table.find(session[:table_id])
    else
      nil
    end
  end

  def current_client
	if session.key?(:client_id)
      Client.find(session[:client_id])
    else
      nil
    end
  end

  def current_waiter
  	if session.key?(:waiter_id)
      Waiter.find(session[:waiter_id])
    else
      nil
    end
  end

  def current_admin
  	if session.key?(:admin_id)
      Admin.find(session[:admin_id])
    else
      nil
    end
  end
end
