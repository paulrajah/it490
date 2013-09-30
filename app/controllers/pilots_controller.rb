class PilotsController < ApplicationController
  before_action :set_pilot, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /pilots
  # GET /pilots.json
  def index
     @pilots = Pilot.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
  end

  # GET /pilots/1
  # GET /pilots/1.json
  def show
  end

  # GET /pilots/new
  def new
    @pilot = Pilot.new
  end

  # GET /pilots/1/edit
  def edit
  end

  # POST /pilots
  # POST /pilots.json
  def create
    @pilot = Pilot.new(pilot_params)

    respond_to do |format|
      if @pilot.save
        format.html { redirect_to @pilot, notice: 'Pilot was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pilot }
      else
        format.html { render action: 'new' }
        format.json { render json: @pilot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pilots/1
  # PATCH/PUT /pilots/1.json
  def update
    respond_to do |format|
      if @pilot.update(pilot_params)
        format.html { redirect_to @pilot, notice: 'Pilot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pilot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pilots/1
  # DELETE /pilots/1.json
  def destroy
    @pilot.destroy
    respond_to do |format|
      format.html { redirect_to pilots_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pilot
      @pilot = Pilot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pilot_params
      params.require(:pilot).permit(:id, :fname, :lname)
    end

    def sort_column
      Pilot.column_names.include?(params[:sort]) ? params[:sort] : "lname"
    end
  
    def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
