class BabiesController < ApplicationController
  def index
    @babies = Baby.all
  end

  def show
    @baby = Baby.find(params[:id])
    @animals = Animal.all
  end

  def new
    @baby = Baby.new
  end
  
  def edit
    @baby = Baby.find(params[:id])
  end
  
  def update
    @baby = Baby.find(params[:id])
    if @baby.update(baby_params)
      redirect_to @baby
    else
      render 'edit'
    end
  end

  def create
    @baby = Baby.new(baby_params)
    if @baby.save
      redirect_to @baby
    else
      render 'new'
    end
  end
  
  def destroy
    @baby = Baby.find(params[:id])
    @baby.destroy
 
    redirect_to babies_path
  end
  
  private
  def baby_params
    params.require(:baby).permit(:name, :height, :weight, :temperature, 
                                :height_unit, :weight_unit, :temperature_unit)
  end
end
