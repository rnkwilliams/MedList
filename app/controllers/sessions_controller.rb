class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username].downcase)
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Sorry, username/password combination does not match. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

  def omniauth
    @user = User.from_google_omniauth(auth)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
