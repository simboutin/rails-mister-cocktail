class ReviewsController < ApplicationController
  before_action :set_cocktail

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def params_review
    params.require(:review).permit(:title, :content, :rating)
  end
end
