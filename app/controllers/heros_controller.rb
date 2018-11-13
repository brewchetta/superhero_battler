class HerosController < ApplicationController
  before_action :find_hero, only: [:show, :edit, :update, :destroy]
  before_action :find_teams, only: [:show]

  def index
    @heros = Hero.all
  end


  def show
  end


  def new
    @hero = Hero.new
  end


  def create
    @hero = Hero.create(hero_params)
    redirect_to @hero
  end

  # TODO -
  # get search results to display properly
  #be able to create a hero from api
  #add nicely displayed hero to team

  def search
    @results = Hero.character_search(params[:name])
    flash[:array] = []
    @results.each do |result|
      flash[:array] << result
    end
    redirect_to heros_path
  end
  #submit button from index hits here
  #get request to api resource of 'character'
  #calls a new method from ApiCommunicator
  #request data stores in instance var

  def add_hero_from_cv
    flash[:powers] = []
    @hero = Hero.new_from_api(params[:api_id])
    redirect_to @hero

    #create a hero
    #do something with the powers
    # @hero_hash[:powers].each do
    #   Find_by(name: )
    # end
    #flash_hash carries single character with Rails model attr
    #Hero is created from flash data
    #redirect to that new hero show page
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

end
