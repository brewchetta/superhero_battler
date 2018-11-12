class BattlesController < ApplicationController
  before_action :find_battle, only: :show

  def show
    @winner = Team.find_by(id: @battle.team_id1)

    @loser = Team.find_by(id: @battle.team_id2)

    @battle.name = "#{@winner.roster_name} vs. #{@loser.roster_name}"
  end

  def new
    @battle = Battle.new
    @teams = Team.all
  end

  # TODO move to application controller for session stuff

  def create
    @battle = Battle.create(battle_params)
    redirect_to @battle
  end

  private

  def find_battle
    @battle = Battle.find_by(id: params[:id])
  end

  def battle_params
    params.require(:battle).permit(:team_id1, :team_id2, :name)
  end

end
