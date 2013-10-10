class ShipmentsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction
  layout 'secure'

  # GET /shipments
  # GET /shipments.json
  def index
     @flights = Flight.search(params[:search]).where(user_id: current_user.id).paginate(:per_page => 25, :page => params[:page])
  end

  private
    def sort_column
      Flight.column_names.include?(params[:sort]) ? params[:sort] : "number"
    end
  
    def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end