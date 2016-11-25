class ElderGallariesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_elder_gallary, only: [:show, :edit, :update, :destroy]
  
  # GET /elder_gallaries
  # GET /elder_gallaries.json
  def index
    @elder_gallaries = current_user.elder_gallaries rescue nil
  end

  # GET /elder_gallaries/1
  # GET /elder_gallaries/1.json
  def show
  end

  # GET /elder_gallaries/new
  def new
    @elder_gallary = ElderGallary.new
  end

  # GET /elder_gallaries/1/edit
  def edit
  end

  # POST /elder_gallaries
  # POST /elder_gallaries.json
  def create
    @elder_gallary = ElderGallary.new(elder_gallary_params)

    respond_to do |format|
      if @elder_gallary.save
        format.html { redirect_to @elder_gallary, notice: 'Elder gallary was successfully created.' }
        format.json { render :show, status: :created, location: @elder_gallary }
      else
        format.html { render :new }
        format.json { render json: @elder_gallary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elder_gallaries/1
  # PATCH/PUT /elder_gallaries/1.json
  def update
    respond_to do |format|
      if @elder_gallary.update(elder_gallary_params)
        format.html { redirect_to @elder_gallary, notice: 'Elder gallary was successfully updated.' }
        format.json { render :show, status: :ok, location: @elder_gallary }
      else
        format.html { render :edit }
        format.json { render json: @elder_gallary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elder_gallaries/1
  # DELETE /elder_gallaries/1.json
  def destroy
    @elder_gallary.destroy
    respond_to do |format|
      format.html { redirect_to elder_gallaries_url, notice: 'Elder gallary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_elder_gallary
      @elder_gallary = ElderGallary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def elder_gallary_params
      params.require(:elder_gallary).permit(:name,:user_id, :photo)
    end
end
