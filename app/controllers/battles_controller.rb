class BattlesController < ApplicationController
  before_action :find_battle, only: [:show, :edit, :update, :team_fight, :destroy]
  before_action :find_user

  def show
    @team1 = @battle.team1
    @team2 = @battle.team2
    @battle.name = "#{@team1.roster_name} vs. #{@team2.roster_name}"
  end

  # @result = @battle.winner[0]
  def team_fight
    if @battle.team1.full? && @battle.team2.full?
      battle_array = @battle.fight
      byebug
      flash[:duels] = []
      flash[:winner] = battle_array[5]
      battle_array.each {|duel| flash[:duels] << duel}
      redirect_to @battle
    else
      flash[:message] = "Teams need to be full to battle"
      @user = User.find_by(id: session[:user_id])
      redirect_to @user
    end
  end

  def index
    @battles = Battle.all
    @battle = Battle.new
    @teams = Team.all
  end

  # Possibly remove
  def new
    @battle = Battle.new
    @teams = Team.all
  end

  # TODO move to application controller for session stuff

  def create
    @battle = Battle.create(battle_params)
    t1 = @battle.team1
    t2 = @battle.team2
    if @battle.team1.full? && @battle.team2.full?
      @battle.name = "#{t1.roster_name} vs. #{t2.roster_name}"
      @battle.save

      redirect_to @battle
    else
      flash[:error] = "Teams must be full"
      redirect_to new_battle_path
    end
  end

  def destroy
    @battle.destroy
    redirect_to battles_path
  end

  private

  def find_battle
    @battle = Battle.find_by(id: params[:id])
  end

  def find_user
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end

  def battle_params
    params.require(:battle).permit(:team_id1, :team_id2, :name)
  end

end
