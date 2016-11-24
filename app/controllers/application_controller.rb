class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_table, :current_client, :current_waiter, :current_admin
  before_action :set_locale

  def set_locale
    if params[:locale] != nil
      session[:locale] = params[:locale]
    end
    I18n.locale = session[:locale] || I18n.default_locale
  end

  def current_table
  	if session.key?(:table_id) and session[:table_id] != nil
      Table.find(session[:table_id])
    else
      nil
    end
  end

  def current_client
	if session.key?(:client_id) and session[:client_id] != nil
      Client.find(session[:client_id])
    else
      nil
    end
  end

  def current_waiter
  	if session.key?(:waiter_id) and session[:waiter_id] != nil
      Waiter.find(session[:waiter_id])
    else
      nil
    end
  end

  def current_admin
  	if session.key?(:admin_id) and session[:admin_id] != nil
      Admin.find(session[:admin_id])
    else
      nil
    end
  end
end
