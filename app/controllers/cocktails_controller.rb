class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update]

  def index
    @homepage = true
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @cocktail.update(params_cocktail)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  def search
    if params[:keyword].present?
      sql_query = " \
        cocktails.name ILIKE :keyword \
        OR ingredients.name ILIKE :keyword \
      "
      @cocktails = Cocktail.joins(:ingredients).distinct.where(sql_query, keyword: "%#{params[:keyword]}%")
    else
      @cocktails = Cocktail.all
    end
    # @cocktails = Cocktail.where('name ILIKE ?', "%#{params[:keyword]}%")
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def params_cocktail
    params.require(:cocktail).permit(:name, :photo)
  end
end
