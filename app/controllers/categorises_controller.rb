class CategorisesController < ApplicationController
  def index
    categorises = Categorise.joins(:large_categorises).merge(LargeCategorise.id_in(params[:large_categorise_id]))
    render json: categorises.select(:id, :categorise_name)

  end
end
