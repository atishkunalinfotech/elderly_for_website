class ElderVideosController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_elder_video, only: [:show, :edit, :update, :destroy]

  # GET /elder_videos
  # GET /elder_videos.json
  def index
    @elder_videos = current_user.elder_videos rescue nil
  end

  # GET /elder_videos/1
  # GET /elder_videos/1.json
  def show
  end

  # GET /elder_videos/new
  def new
    @elder_video = ElderVideo.new
  end

  # GET /elder_videos/1/edit
  def edit
  end

  # POST /elder_videos
  # POST /elder_videos.json
  def create
    @elder_video = ElderVideo.new(elder_video_params)

    respond_to do |format|
      if @elder_video.save
        format.html { redirect_to @elder_video, notice: 'Elder video was successfully created.' }
        format.json { render :show, status: :created, location: @elder_video }
      else
        format.html { render :new }
        format.json { render json: @elder_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elder_videos/1
  # PATCH/PUT /elder_videos/1.json
  def update
    respond_to do |format|
      if @elder_video.update(elder_video_params)
        format.html { redirect_to @elder_video, notice: 'Elder video was successfully updated.' }
        format.json { render :show, status: :ok, location: @elder_video }
      else
        format.html { render :edit }
        format.json { render json: @elder_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elder_videos/1
  # DELETE /elder_videos/1.json
  def destroy
    @elder_video.destroy
    respond_to do |format|
      format.html { redirect_to elder_videos_url, notice: 'Elder video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_elder_video
      @elder_video = ElderVideo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def elder_video_params
      params.require(:elder_video).permit(:name,:video,:user_id)
    end
end
