class ClientSessionsController < ApplicationController
	def create
    user = Client.from_omniauth(env["omniauth.auth"])
    session[:client_id] = user.id
    redirect_to root_path
  end
 
  def destroy
    session[:client_id] = nil
    redirect_to root_path
  end

end
