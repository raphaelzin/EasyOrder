class AdminSessionsController < ApplicationController
	def create
    admin = Admin.find_by(name: session_params[:name])
    if admin && admin.authenticate(session_params[:password])
      session[:admin_id] = admin.id
      redirect_to admins_home_path
    else
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    redirect_to admins_login_path, notice: 'Bye!'
  end

  private

  def session_params
    params.require(:session).permit(:name, :password)
  end
end
