class FlightsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin_filter

  before_action :set_flight, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  layout 'secure'

  # GET /flights
  # GET /flights.json
  def index
     @flights = Flight.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
  end

  # GET /flights/1
  # GET /flights/1.json
  def show
  end

  # GET /flights/new
  def new
    shipment_request = ShipmentRequest.find(params[:shipment_request_id])

    @flight = Flight.new
    @flight.user_id = shipment_request.user_id
    @flight.request_id = shipment_request.id
    @flight.origin_id = shipment_request.origin_id
    @flight.destination_id = shipment_request.destination_id
    @flight.departure_time = shipment_request.desired_departure_datetime
    @flight.arrival_time = (shipment_request.desired_departure_datetime + 6.hours).to_datetime

    cargo = Cargo.new
    cargo.weight = shipment_request.cargo_weight
    cargo.contents = shipment_request.cargo_contents

    @flight.cargo = cargo
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights
  # POST /flights.json
  def create
    logger.info "flight_params: #{flight_params.inspect}"

    # This is hack, to get around the type mismatch, don't fully understand strong params yet
    @cargo = Cargo.new
    @cargo.weight = flight_params[:cargo][:weight]
    @cargo.contents = flight_params[:cargo][:contents]
    logger.info "@cargo: #{@cargo.inspect}"
    @cargo.save

    @flight = Flight.new
    @flight.number = flight_params[:number]
    @flight.user_id = flight_params[:user_id]
    @flight.request_id = flight_params[:request_id]
    @flight.aircraft_id = flight_params[:aircraft_id]
    @flight.origin_id = flight_params[:origin_id]
    @flight.destination_id = flight_params[:destination_id]
    @flight.departure_time = DateTime.new(flight_params["departure_time(1i)"].to_i, flight_params["departure_time(2i)"].to_i, flight_params["departure_time(3i)"].to_i, flight_params["departure_time(4i)"].to_i, flight_params["departure_time(5i)"].to_i)
    @flight.arrival_time = DateTime.new(flight_params["arrival_time(1i)"].to_i, flight_params["arrival_time(2i)"].to_i, flight_params["arrival_time(3i)"].to_i, flight_params["arrival_time(4i)"].to_i, flight_params["arrival_time(5i)"].to_i)
    @flight.cargo_id = @cargo.id
    @flight.aircrew_id = flight_params[:aircrew_id]

    logger.info "@flight: #{@flight.inspect}"

    respond_to do |format|

      if @flight.save
        request = ShipmentRequest.find(@flight.request_id)
        request.is_accepted = true
        request.save

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
      params.require(:flight).permit(:request_id, :user_id, :aircraft_id, :number, :aircrew_id, :origin_id, :destination_id, :departure_time, :arrival_time, cargo: [:weight, :contents])
    end

    def sort_column
      Flight.column_names.include?(params[:sort]) ? params[:sort] : "number"
    end
  
    def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
