class ParticipantsController < ApplicationController
  before_action :set_participant, only: %i[ show edit update destroy ]

  # GET /participants or /participants.json
  def index
    @participants = Participant.all
  end

  # GET /participants/1 or /participants/1.json
  def show
    #puts "Check"
    #puts :geid
    #@participant = Participant.find(params[:geid])
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
      render 'new'  
    end
  end

  # PATCH/PUT /participants/1 or /participants/1.json
  def update
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to @participant }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
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
end
