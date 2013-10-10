class AircraftTypesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin_filter

  before_action :set_aircraft_type, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  layout 'secure'

  # GET /aircraft_types
  # GET /aircraft_types.json
  def index
    @aircraft_types = AircraftType.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
  end

  # GET /aircraft_types/1
  # GET /aircraft_types/1.json
  def show
  end

  # GET /aircraft_types/new
  def new
    @aircraft_type = AircraftType.new
  end

  # GET /aircraft_types/1/edit
  def edit
  end

  # POST /aircraft_types
  # POST /aircraft_types.json
  def create
    @aircraft_type = AircraftType.new(aircraft_type_params)

    respond_to do |format|
      if @aircraft_type.save
        format.html { redirect_to @aircraft_type, notice: 'Aircraft type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @aircarft_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @aircraft_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aircraft_types/1
  # PATCH/PUT /aircraft_types/1.json
  def update
    respond_to do |format|
      if @aircraft_type.update(aircraft_type_params)
        format.html { redirect_to @aircraft_type, notice: 'Aircraft type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @aircraft_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aircraft_types/1
  # DELETE /aircraft_types/1.json
  def destroy
    @aircraft_type.destroy
    respond_to do |format|
      format.html { redirect_to aircraft_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aircraft_type
      @aircraft_type = AircraftType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aircraft_type_params
      params.require(:aircraft_type).permit(:id, :code, :name)
    end

    def sort_column
      AircraftType.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
  
    def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
