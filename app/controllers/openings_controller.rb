class OpeningsController < ApplicationController
  before_action :set_opening, only: %i[ show edit update destroy cancel reopen ]
  before_action :choice_field, only: %i[ new edit ]
  before_action :check_action, only: %i[ create update ]

  # GET /openings or /openings.json
  def index
    @draft = sort_category("Draft")
    puts @draft
    @pending = sort_category("Pending Applications")
    @offered = sort_category("Position Offered")
    @accepted = sort_category("Accepted")
    @complete = sort_category("Complete")
    @cancelled = sort_category("Cancelled")
  end

  # Get open positions for applications
  def open
    @student = Opening.where(status: "Pending Applications", position: "Full Time", program: true)
    @intern = Opening.where(status: "Pending Applications", position: "Internship", program: true)
    @general = Opening.where(status: "Pending Applications", position: "Full Time", program: false)
  end

  # GET /openings/1 or /openings/1.json
  def show
  end

  # GET /openings/new
  def new
    @opening = Opening.new
  end

  # GET /openings/1/edit
  def edit
  end

  # POST /openings or /openings.json
  def create
    @opening = Opening.new(opening_params)
    @opening.status = pubstat ? "Pending Applications" : "Draft"

    respond_to do |format|
      if @opening.save
        format.html { redirect_to openings_path }
        format.json { render :show, status: :created, location: @opening }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @opening.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /openings/1 or /openings/1.json
  def update
    @opening.status = pubstat ? "Pending Applications" : "Draft"
    puts @opening

    respond_to do |format|
      if @opening.update(opening_params)
        format.html { redirect_to openings_path }
        format.json { render :show, status: :ok, location: @opening }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @opening.errors, status: :unprocessable_entity }
      end
    end
  end

  def cancel
    @opening.status = "Cancelled"
    puts @opening.firstname

    respond_to do |format|
      if @opening.update(params.permit(:status))
        format.html { redirect_to openings_path }
        format.json { render :show, status: :ok, location: @opening }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @opening.errors, status: :unprocessable_entity }
      end
    end
  end

  def reopen
    @opening.status = "Draft"
    puts @opening.firstname

    respond_to do |format|
      if @opening.update(params.permit(:status))
        format.html { redirect_to edit_opening_path(@opening) }
        format.json { render :show, status: :ok, location: @opening }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @opening.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /openings/1 or /openings/1.json
  def destroy
    @opening.destroy
    respond_to do |format|
      format.html { redirect_to openings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opening
      @opening = Opening.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def opening_params
      params.require(:opening).permit(:firstname, :lastname, :qualification, :status, :position, :geid, :program, :description, :responsibility, :level => [])
    end

    # Confirm status
    def pubstat
      params[:commit] == "Submit"
    end

    # Set choices
    def choice_field
      @jobtype = ["Internship", "Full Time"]
      @level = ["Any", "Pre-Associate", "Near Associate", "Recent Associate", "Near Fellow"]
    end

    # Set index filters
    def sort_category(statname)
      Opening.where(:status => statname).sort_by {|obj| obj.position}.sort_by {|obj| obj.firstname}.sort_by {|obj| obj.lastname}
    end

    # Check for cancellation
    def check_action
      if params[:cancel]
        redirect_to openings_path
      end
    end
end
