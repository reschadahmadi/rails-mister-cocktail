class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:create]


  def index
    @cocktails = Cocktail.all
  end

  def create
    @cocktail.assign_attributes(cocktail_params)
    if @cocktail.save
      flash[:notice] = t(:successfully_created)
    else
      flash[:error] = @cocktail.errors.full_messages.join(', ')
    end
  end

  def new
    @cocktail = Cocktail.new
    @cocktail.doses.build
  end

  def show
    @cocktail = Cocktail.find_by(params[:id])
  end


  private

  def cocktail_params
    params.require(:cocktail).permit!
  end

  def set_cocktail
    @cocktail = Cocktail.new
  end
end
