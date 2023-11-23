class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    # raise <-- Uncomment this line to see what the params are in your browser.
    # If we are selecting multiple tags at one time, we will need to create a new plant tag for each tag identified.
    tags = Tag.where(id: params[:plant_tag][:tag_id])
    tags.each do |tag|
      @plant_tag = PlantTag.new(plant: @plant, tag: tag)
      
      unless @plant_tag.save
        @error_messages ||= [] 
        @error_messages << @plant_tag.errors.full_messages # If there is an error message on one plant tag attempt, we can save them here
      end
    end
    if @error_messages.present?
      flash.now[:error] = @error_messages.flatten.join(', ') # Then we can present our error messages to the user.
      render :new, status: :unprocessable_entity
    else
      redirect_to @plant.garden, notice: "Tag was successfully added." # If not, success!
    end

  # You may have noticed I removed our private section with def plant_params. It's not really necessary in this case.
  end 
end
