class ShipmentRequestsController < ApplicationController
  before_filter :authenticate_user!

  layout 'secure'

  # GET /shipment_request
  # GET /shipment_request.json
  def index
    if current_user.try(:is_admin?)
      @shipment_requests = ShipmentRequest.where(is_accepted: false).paginate(:per_page => 25, :page => params[:page])
    else
      @shipment_requests = ShipmentRequest.where(user_id: current_user.id, is_accepted: false).paginate(:per_page => 25, :page => params[:page])
    end
  end

  # GET /shipment_request/new
  def new
    @shipment_request = ShipmentRequest.new
  end

  # POST /shipment_request
  # POST /shipment_request.json
  def create
    @shipment_request = ShipmentRequest.new(shipment_request_params)

    # set owner of shipment request
    @shipment_request.user_id = current_user.id

    respond_to do |format|
      if @shipment_request.save
        format.html { redirect_to action: 'index', notice: 'Shipment Request was successfully created.' }
        format.json { render action: 'index', status: :created, location: @shipment_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @shipment_request.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def shipment_request_params
      params.require(:shipment_request).permit(:cargo_weight, :cargo_contents, :origin_id, :destination_id, :desired_departure_datetime)
    end

end
