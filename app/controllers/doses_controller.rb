class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  def new
    @dose = Dose.new
  end
 #des quon aura un id dans les routes, ca nous indique en grle quon
 #
  #etant donné que dose est nesté dans cocktail, des quon
  #va instancier une dose, on ira chercher le

  def create
    @dose = Dose.new(params_dose)
    @dose.cocktail_id = @cocktail.id
    if @dose.save
    redirect_to cocktail_path(@cocktail)
  else
    render :new
  end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to :back
  end
  private
  def params_dose
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
