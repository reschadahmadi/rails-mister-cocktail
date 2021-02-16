class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:create]
  before_action :find_cocktail, only: %i(show edit update destroy)

  def index
    @cocktails = Cocktail.all.order('updated_at desc')
  end

  def create
    @cocktail.assign_attributes(cocktail_params)

    if @cocktail.save
      flash[:notice] = t(:successfully_created)
      redirect_to cocktails_path
    else
      flash[:notice] = @cocktail.errors.full_messages.join(', ')
      redirect_back(fallback_location: root_path)
    end
  end

  def new
    @cocktail = Cocktail.new
    @cocktail.doses.build
  end

  def update
    @cocktail.assign_attributes(cocktail_params)

    if @cocktail.save
      flash[:notice] = t(:successfully_updated)
    else
      flash[:notice] = @cocktail.errors.full_messages.join(', ')
    end

    redirect_back(fallback_location: root_path)
  end

  def destroy
    if @cocktail.destroy
      flash[:notice] = t(:successfully_destroyed)
    else
      flash[:notice] = @cocktail.errors.full_messages.join(', ')
    end

    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit!
  end

  def find_cocktail
    @cocktail = Cocktail.find_by(id: params[:id])
  end

  def set_cocktail
    @cocktail = Cocktail.new
  end
end
