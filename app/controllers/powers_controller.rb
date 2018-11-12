class PowersController < ApplicationController
  before_action :find_power, only: [:show, :edit, :update, :destroy]
  before_action :find_heros, only: [:show]

  def index
    @powers = Power.all
  end


  def show

  end


  def new
    @power = Power.new
  end


  def create
    @power = Power.create(power_params)
    redirect_to @power
  end


  def edit
  end


  def update
  end


  def destroy
  end

  private

  def power_params
    params.require(:power).permit(:name, :description)
  end

  def find_power
    @power = Power.find_by(id: params[:id])
  end

  def find_heros
    @heros = find_power.heros
  end

end
