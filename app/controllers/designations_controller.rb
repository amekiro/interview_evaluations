class DesignationsController < ApplicationController
  before_action :set_designation, only: %i[ show edit update destroy ]
  before_action :check_action, only: %i[ create update ]

  # GET /designations or /designations.json
  def index
    @designations = Designation.all.sort_by {|obj| obj.code}
  end

  # GET /designations/1 or /designations/1.json
  def show
  end

  # GET /designations/new
  def new
    @designation = Designation.new
  end

  # GET /designations/1/edit
  def edit
  end

  # POST /designations or /designations.json
  def create
    @designation = Designation.new(designation_params)

    if @designation.save
      redirect_to designations_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /designations/1 or /designations/1.json
  def update
    respond_to do |format|
      if @designation.update(designation_params)
        format.html { redirect_to @designation, notice: "Designation was successfully updated." }
        format.json { render :show, status: :ok, location: @designation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @designation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /designations/1 or /designations/1.json
  def destroy
    @designation.destroy
    respond_to do |format|
      format.html { redirect_to designations_url, notice: "Designation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_designation
      @designation = Designation.find_by code: params[:id]
    end

    # Only allow a list of trusted parameters through.
    def designation_params
      params.require(:designation).permit(:code, :designation)
    end

    def check_action
      if params[:cancel]
        redirect_to designations_path
      end
    end
end
