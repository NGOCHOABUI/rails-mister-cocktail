class CocktailsController < ApplicationController

  before_action :find_cocktail, only: [:show]
  def home
  end
  def index
    # if params[:query].present?
    #   @query = params[:query]
    #   @cocktails = Cocktail.where("name iLike '%#{params[:query]}%'")
    # else
    #   @cocktails = Cocktail.all
    # end
    @cocktails = Cocktail.all
  end
  def show
  end
  def new
    @cocktail = Cocktail.new
  end
  def create
    @cocktail = Cocktail.create(params_cocktail)
    if @cocktail.valid?
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def params_cocktail
    params.require(:cocktail).permit(:name, :photo)
  end

end
