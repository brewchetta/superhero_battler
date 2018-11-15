class HerosController < ApplicationController
  before_action :find_hero, only: [:show, :edit, :update, :destroy]
  before_action :find_teams, only: [:show]
  before_action :current_team #For adding heros to current team (if not full)

  def index
    @heros = Hero.order(:name).page params[:page]
  end


  def show
  end


  def new
    @hero = Hero.new
    redirect_to heros_path
  end


  def create
    @hero = Hero.create(hero_params)
    redirect_to @hero
  end

  def search_results
    render :search_results
  end

  def search
    @results = Hero.character_search(params[:name])
    flash[:array] = []
    @results.each do |result|
      flash[:array] << result
    end
    redirect_to hero_search_results_path
    #submit button from index hits her
  end


  # From team show page, adds hero to that team
  def add_to_team
    session[:current_team_id] = Team.find_by(id: params[:id]).id
    redirect_to heros_path
  end

  # Finds new hero from comic vine
  def add_hero_from_cv
    @hero = Hero.new_from_api(params[:api_id])
    if @hero.valid?
      @hero.save
      redirect_to @hero
    else
      flash[:errors] = @hero.errors.full_messages
      redirect_to heros_path
    end
  end

  def edit
  end


  def update
  end


  def destroy
  end

  private

  def hero_params
    params.require(:hero).permit(:name, :description, :image_url, :api_id, :api_url)
  end

  def find_hero
    @hero = Hero.find_by(id: params[:id])
  end

  def find_teams
    @teams = find_hero.teams
  end

  def current_team
    @team = Team.find_by(id: session[:current_team_id]) if session[:current_team_id]
  end

end
