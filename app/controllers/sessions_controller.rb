class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Sorry! Your username and password don't match, please try again."
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

end
