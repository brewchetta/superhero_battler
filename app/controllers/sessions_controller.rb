class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      redirect_to @user
    else
      redirect_to login_path
    end
  end

end