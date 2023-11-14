class PetsController < ApplicationController
  before_action :set_pet, only: [:show,:edit,:update,:destroy]
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @pet.update(pet_params)
    redirect_to @pet
  end

  def destroy
    @pet.destroy
    redirect_to pets_path, status: :see_other
  end




  private

  def set_pet
    @pet = Pet.find(params[:id])
  end


  def pet_params
    params.require(:pet).permit(:name,:species,:address,:found_on)
  end



end
