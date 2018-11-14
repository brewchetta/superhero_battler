class BattlesController < ApplicationController
  before_action :find_battle, only: [:show, :edit, :update, :team_fight, :destroy]

  def show
    @team1 = @battle.team1
    @team2 = @battle.team2
    @battle.name = "#{@team1.roster_name} vs. #{@team2.roster_name}"

  end

  #button on the show page which begins the fight
  #what data is available after the request?
  #button hits controller action containing fight logic
  #redirects or renders a new view displaying winner

  def team_fight
    @score_hash = @battle.fight
    flash[:winner] = @score_hash.max_by{|team, score| score }[0].roster_name
    byebug
    redirect_to @battle
  end

  def index
    @battles = Battle.all
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
