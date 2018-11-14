class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to login_path unless logged_in?
    end
  end

  def logged_in?
    !!current_user
  end

end
