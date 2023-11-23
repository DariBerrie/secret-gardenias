class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @tag = Tag.find_by(category: params[:plant_tag][:tag])
    @plant_tag = PlantTag.new(plant: @plant, tag: @tag)

    if @plant_tag.save
      redirect_to @plant.garden, notice: "Plant was successfully classified."
    else
      render :new, status: :unprocessable_entity
    end

  end 

  private
  
  def plant_tag_params
    params.require(:plant_tag).permit(:plant_id)
  end
end
