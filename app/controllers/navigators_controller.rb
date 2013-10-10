class NavigatorsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin_filter

  before_action :set_navigator, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  layout 'secure'
  
  # GET /navigators
  # GET /navigators.json
  def index
     @navigators = Navigator.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
  end

  # GET /navigators/1
  # GET /navigators/1.json
  def show
  end

  # GET /navigators/new
  def new
    @navigator = Navigator.new
  end

  # GET /navigators/1/edit
  def edit
  end

  # POST /navigators
  # POST /navigators.json
  def create
    @navigator = Navigator.new(navigator_params)

    respond_to do |format|
      if @navigator.save
        format.html { redirect_to @navigator, notice: 'Navigator was successfully created.' }
        format.json { render action: 'show', status: :created, location: @navigator }
      else
        format.html { render action: 'new' }
        format.json { render json: @navigator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /navigators/1
  # PATCH/PUT /navigators/1.json
  def update
    respond_to do |format|
      if @navigator.update(navigator_params)
        format.html { redirect_to @navigator, notice: 'Navigator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @navigator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /navigators/1
  # DELETE /navigators/1.json
  def destroy
    @navigator.destroy
    respond_to do |format|
      format.html { redirect_to navigators_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_navigator
      @navigator = Navigator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def navigator_params
      params.require(:navigator).permit(:id, :fname, :lname)
    end

    def sort_column
      Navigator.column_names.include?(params[:sort]) ? params[:sort] : "lname"
    end
  
    def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
