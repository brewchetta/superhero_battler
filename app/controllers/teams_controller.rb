class TeamsController < ApplicationController
  before_action :find_team, only: [:show, :edit, :update, :destroy]

  # Now that team is nested, we need to find the user for most actions
  before_action :find_user

  def index
    @teams = Team.all
  end


  def show
    @heros = @team.heros
  end


  def new
    @team = Team.new
  end


  def create
    @team = Team.new(team_params)
    @user.teams << @team
    @team.save
    byebug
    redirect_to user_team_path(@user, @team)
  end


  def edit
  end


  def update
  end


  def destroy
  end

  private

  def team_params
    params.require(:team).permit(:roster_name, :user_id)
  end

  def find_team
    @team = Team.find_by(id: params[:id])
  end

  def find_user
    @user = User.find_by(id: params[:user_id])
  end

end
