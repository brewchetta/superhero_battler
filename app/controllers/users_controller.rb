class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :find_teams, only: [:show]

  def index
    @users = User.all
  end


  def show
  end


  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to new_user_path
    end
  end


  def edit
    if session[:user_id]
      if @user.id == session[:user_id]
        render 'edit'
      else
        redirect_to users_path
      end
    else
      redirect_to login_path
    end
  end


  def update
    @user.update(user_params)

    redirect_to @user
  end


  def destroy
    session.delete(:user_id)
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def find_teams
    @teams = find_user.teams
  end

end
