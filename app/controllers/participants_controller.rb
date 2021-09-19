class ParticipantsController < ApplicationController
  before_action :set_participant, only: %i[ show edit update destroy ]
  before_action :set_fields, only: %i[ new edit ]
  before_action :check_action, only: %i[ create update ]

  # GET /participants or /participants.json
  def index
    @participants = Participant.all.sort_by {|obj| obj.firstname}.sort_by {|obj| obj.lastname}
  end

  def indexProg

  end

  # GET /participants/1 or /participants/1.json
  def show
    
  end

  # GET /participants/new
  def new
    @participant = Participant.new
  end

  # GET /participants/1/edit
  def edit

  end

  # POST /participants or /participants.json
  def create
    @participant = Participant.new(participant_params)

    if @participant.save
      redirect_to participants_path
    else
      puts "Failure"
      puts @participant.errors.full_messages
      render 'new'  
    end
  end

  # PATCH/PUT /participants/1 or /participants/1.json
  def update
    puts "Check"
    @participant = Participant.find(params[@participant.id])
    puts @participant
    if @participant.update(participant_params)
        puts "Success"
        redirect_to participants_path
    else
        puts "Failure"
        render 'edit'
    end
  end

  # DELETE /participants/1 or /participants/1.json
  def destroy
    @participant.destroy
    respond_to do |format|
      format.html { redirect_to participants_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find_by geid: params[:id]
    end

    # Only allow a list of trusted parameters through.
    def participant_params
      params.require(:participant).permit!
    end

    # Set fields
    def set_fields
      @designations = Designation.all.sort_by {|obj| obj.code}
      @status = ["Active", "Inactive"]
      @replacement = ["N/A", "Pending", "No Replacement Needed", "Replaced"]
    end

    # Check for cancellation
    def check_action
      if params[:cancel]
        redirect_to participants_path
      end
    end
end
