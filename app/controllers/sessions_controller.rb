class SessionsController < ApplicationController

  def new
    render 'login'
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notify] = "Invalid username or password"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to users_path
  end

end
