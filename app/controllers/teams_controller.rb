class TeamsController < ApplicationController
  before_action :find_team, only: [:show, :edit, :update, :destroy, :add_hero, :add_to_team]
  # Now that team is nested, we need to find the user for most actions
  before_action :find_user

  def index
    @teams = Team.all
  end

  def add_hero
    @hero = Hero.find_by(id: params[:team][:hero_id])
    if !@team.heros.include?(@hero)
      @team.heros << @hero
      redirect_to edit_user_team_path(@user, @team)
    else
      flash[:errors] = []
      @team.errors.add(:hero_id, "cannot have duplicate heroes on the same team")
      flash[:errors] << @team.errors.full_messages[0]

      redirect_to edit_user_team_path(@user, @team)
    end
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
    redirect_to user_team_path(@user, @team)
  end

  def edit
  end


  def update
    byebug
    @team.update(team_params)
    byebug
    if @team.valid?
      redirect_to user_team_path(@user, @team)
    else
      flash[:errors] = []
      flash[:errors] << @team.errors.full_messages

      redirect_to edit_user_team_path(@user, @team)
    end
  end

  # Adds hero to team once found
  def add_to_team
    @team.heros << Hero.find_by(id: params[:hero_id])

    redirect_to user_team_path(@user, @team)
  end


  def destroy
    @team.destroy
    session[:current_team_id]

    redirect_to user_path(@user)
  end

  private

  def team_params
    params.require(:team).permit(:roster_name, :user_id, :hero_id)
  end

  def find_team
    @team = Team.find_by(id: params[:id])
  end

  def find_user
    @user = User.find_by(id: params[:user_id])
  end

end
