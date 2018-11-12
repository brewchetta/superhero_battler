class TeamsController < ApplicationController
  before_action :find_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end


  def show
    @user = @team.user
    @heros = @team.heros
  end


  def new
    @team = Team.new
  end


  def create
    @team = Team.create(team_params)
    redirect_to @team
  end


  def edit
  end


  def update
  end


  def destroy
  end

  private

  def team_params
    params.require(:team).permit(:roster_name)
  end

  def find_team
    @team = Team.find_by(id: params[:id])
  end

end
