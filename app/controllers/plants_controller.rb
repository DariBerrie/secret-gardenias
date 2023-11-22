class PlantsController < ApplicationController

  def create
    @plant = Plant.new(plant_params)
    garden = Garden.find(params[:garden_id])
    @plant.garden = garden

    if @plant.save
      redirect_to garden, notice: "#{@plant.name} was successfully planted."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    garden = @plant.garden
    name = @plant.name

    @plant.destroy!
    redirect_to garden, notice: "#{name} was successfully uprooted.", status: :see_other
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url, :garden_id)
  end
end
