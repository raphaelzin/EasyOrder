class SessionsController < ApplicationController

def create
    user = Waiter.find_by(name: session_params[:name])

    if user && user.authenticate(session_params[:password])
      session[:waiter_id] = user.id
      redirect_to waiters_tables_path, notice: 'Hi, friend!'
    else
      redirect_to root_path, notice: 'No way!'
    end
  end

  

  def destroy
    reset_session
    redirect_to waiters_login_path, notice: 'Bye!'
  end

  private

  def session_params
    params.require(:session).permit(:name, :password)
  end

end
