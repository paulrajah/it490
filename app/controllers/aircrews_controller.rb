class AircrewsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin_filter

  before_action :set_aircrew, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  layout 'admin'

  # GET /aircrews
  # GET /aircrews.json
  def index
     #@aircrews = Aircrew.order(sort_direction).paginate(:per_page => 25, :page => params[:page])
     @aircrews = Aircrew.all.paginate(:per_page => 25, :page => params[:page])
  end

  # GET /aircrews/1
  # GET /aircrews/1.json
  def show
  end

  # GET /aircrews/new
  def new
    @aircrew = Aircrew.new
  end

  # GET /aircrews/1/edit
  def edit
  end

  # POST /aircrews
  # POST /aircrews.json
  def create
    @aircrew = Aircrew.new(aircrew_params)

    respond_to do |format|
      if @aircrew.save
        format.html { redirect_to @aircrew, notice: 'Aircrew was successfully created.' }
        format.json { render action: 'show', status: :created, location: @aircrew }
      else
        format.html { render action: 'new' }
        format.json { render json: @aircrew.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aircrews/1
  # PATCH/PUT /aircrews/1.json
  def update
    respond_to do |format|
      if @aircrew.update(aircrew_params)
        format.html { redirect_to @aircrew, notice: 'Aircrew was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @aircrew.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aircrews/1
  # DELETE /aircrews/1.json
  def destroy
    @aircrew.destroy
    respond_to do |format|
      format.html { redirect_to aircrews_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aircrew
      @aircrew = Aircrew.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aircrew_params
      params.require(:aircrew).permit(:pilot_id, :navigator_id)
    end
end
