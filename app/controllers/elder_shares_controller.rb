class ElderSharesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_elder_share, only: [:show, :edit, :update, :destroy]

  # GET /elder_shares
  # GET /elder_shares.json
  def index
    @elder_shares = ElderShare.all
  end

  # GET /elder_shares/1
  # GET /elder_shares/1.json
  def show
  end

  def update_share
    @group = current_user.groups.first
    @group_member = @group.group_memberships
    @group_member.each do |group|
      @elder_share = ElderShare.create(:sender_id => current_user.id, :receiver_id => group.user_id, :elder_gallary_id => params[:elder_photo])
    end
    redirect_to :back
  end

  def update_share_video
    @group = current_user.groups.first
    @group_member = @group.group_memberships
    @group_member.each do |group|
      @elder_share = ElderShare.create(:sender_id => current_user.id, :receiver_id => group.user_id, :elder_video_id => params[:elder_video]) 
    end
    redirect_to :back
  end

  # GET /elder_shares/new
  def new
    @elder_share = ElderShare.new
  end

  # GET /elder_shares/1/edit
  def edit
  end

  # POST /elder_shares
  # POST /elder_shares.json
  def create
    @elder_share = ElderShare.new(elder_share_params)

    respond_to do |format|
      if @elder_share.save
        format.html { redirect_to @elder_share, notice: 'Elder share was successfully created.' }
        format.json { render :show, status: :created, location: @elder_share }
      else
        format.html { render :new }
        format.json { render json: @elder_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elder_shares/1
  # PATCH/PUT /elder_shares/1.json
  def update
    respond_to do |format|
      if @elder_share.update(elder_share_params)
        format.html { redirect_to @elder_share, notice: 'Elder share was successfully updated.' }
        format.json { render :show, status: :ok, location: @elder_share }
      else
        format.html { render :edit }
        format.json { render json: @elder_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elder_shares/1
  # DELETE /elder_shares/1.json
  def destroy
    @elder_share.destroy
    respond_to do |format|
      format.html { redirect_to elder_shares_url, notice: 'Elder share was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_elder_share
      @elder_share = ElderShare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def elder_share_params
      params.require(:elder_share).permit(:sender_id, :receiver_id, :elder_gallary_id,:elder_video_id)
    end
end
