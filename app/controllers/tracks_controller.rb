class TracksController < ApplicationController
  before_action :set_track, only: %i[ show edit update destroy ]
  before_action :choice_field, only: %i[ new edit ]
  before_action :check_action, only: %i[ create update ]

  # GET /tracks or /tracks.json
  def index
    @tracks = Track.all.sort_by {|obj| obj.status}.sort_by {|obj| obj.code}
  end

  # GET /tracks/1 or /tracks/1.json
  def show
  end

  # GET /tracks/new
  def new
    @track = Track.new
  end

  # GET /tracks/1/edit
  def edit
  end

  # POST /tracks or /tracks.json
  def create
    @track = Track.new(track_params)
    respond_to do |format|
      if @track.save
        format.html { redirect_to tracks_path }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracks/1 or /tracks/1.json
  def update
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to tracks_path }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1 or /tracks/1.json
  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to tracks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def track_params
      params.require(:track).permit(:code, :name, :status)
    end

    # Set choices
    def choice_field
      @status = ["Currently offered", "No longer offered"]
    end

    # Check for cancellation
    def check_action
      if params[:cancel]
        redirect_to tracks_path
      end
    end
end
