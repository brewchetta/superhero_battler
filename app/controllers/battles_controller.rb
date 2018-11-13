class BattlesController < ApplicationController
  before_action :find_battle, only: :show

  def show
    @contender1 = Team.find_by(id: @battle.team_id1)
    @contender2 = Team.find_by(id: @battle.team_id2)
    @battle.name = "#{@contender1.roster_name} vs. #{@contender2.roster_name}"
  end

  #button on the show page which begins the fight
  #what data is available after the request?
  #button hits controller action containing fight logic
  #redirects or renders a new view displaying winner






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
