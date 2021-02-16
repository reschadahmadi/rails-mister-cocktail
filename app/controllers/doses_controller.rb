class DosesController < ApplicationController
  before_action :set_dose, only: [:create]

  def create
    @dose.assign_attributes(dose_params)

    if @dose.save
      flash[:notice] = t(:successfully_created)
      redirect_to cocktail_path(@dose.cocktail)
    else
      flash[:notice] = @dose.errors.full_messages.join(', ')
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @dose = Dose.find_by(id: params[:id])

    if @dose.destroy
      flash[:notice] = t(:successfully_destroyed)
    else
      flash[:notice] = @dose.errors.full_messages.join(', ')
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def dose_params
    params.require(:dose).permit!
  end

  def set_dose
    @dose = Dose.new
  end
end
