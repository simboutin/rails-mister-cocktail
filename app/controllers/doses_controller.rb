class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]

  def index
    @doses = Dose.all
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(params_dose)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def params_dose
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
