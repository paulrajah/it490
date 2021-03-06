class UserManagerController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin_filter

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  layout 'secure'

  # GET /user_manager
  # GET /user_manager.json
  def index
     @users = User.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 25, :page => params[:page])
  end

  # GET /user_manager/1
  # GET /user_manager/1.json
  def show
  end

  # GET /user_manager/new
  def new
    @user = User.new
  end

  # GET /user_manager/1/edit
  def edit
  end

  # POST /user_manager
  # POST /user_manager.json
  def create

    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_manager_index_path(@user), notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_manager/1
  # PATCH/PUT /user_manager/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_manager_index_path(@user), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_manager/1
  # DELETE /user_manager/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to user_manager_index_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id, :email, :password, :password_confirmation)
    end

    def sort_column
      Pilot.column_names.include?(params[:sort]) ? params[:sort] : "email"
    end
  
    def sort_direction
       %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
