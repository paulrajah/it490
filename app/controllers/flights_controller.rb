class FlightsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin_filter

  before_action :set_flight, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  layout 'admin'

  # GET /flights
  # GET /flights.json
  def index
     @flights = Flight.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
     #@flights = Flight.all.paginate(:per_page => 25, :page => params[:page])
  end

  # GET /flights/1
  # GET /flights/1.json
  def show
  end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights
  # POST /flights.json
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: 'Flight was successfully created.' }
        format.json { render action: 'show', status: :created, location: @flight }
      else
        format.html { render action: 'new' }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1
  # PATCH/PUT /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to @flight, notice: 'Flight was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1
  # DELETE /flights/1.json
  def destroy
    @flight.destroy
    respond_to do |format|
      format.html { redirect_to flights_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flight_params
      params.require(:flight).permit(:number, :origin, :origin, :departure_time, :arrival_time)
    end

    def sort_column
      Flight.column_names.include?(params[:sort]) ? params[:sort] : "number"
    end
  
    def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
