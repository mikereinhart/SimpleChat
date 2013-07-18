class SessionsController < ApplicationController
  def new
    # p session
  end
  
  def create
    user = User.find_by_username(params[:username])
    authenticated_user = user.authenticate(params[:password])
    if authenticated_user
      p 'authenticated==========='
      session[:user_id] = authenticated_user.id
      redirect_to root_path
    else
      p 'not authenticated==================='
      redirect_to sessions_new_path
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to sessions_new_path
  end
end