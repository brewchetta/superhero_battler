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
