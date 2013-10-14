class CargoController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin_filter

  before_action :set_cargo, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  layout 'secure'

  # GET /cargos
  # GET /cargos.json
  def index
     @cargo = Cargo.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cargo
      @cargo = Cargo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cargo_params
      params.require(:cargo).permit(:weight, :contents)
    end

    def sort_column
      Cargo.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
