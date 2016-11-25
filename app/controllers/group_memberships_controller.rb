class GroupMembershipsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_group_membership, only: [:show, :edit, :update, :destroy]

  # GET /group_memberships
  # GET /group_memberships.json
  def index
    @group_memberships = GroupMembership.all
  end

  # GET /group_memberships/1
  # GET /group_memberships/1.json
  def show
  end

  # GET /group_memberships/new
  def new
    @group_memberships = GroupMembership.where('group_id=?',params[:group_id]) rescue nil
    a = []
    @group_memberships.each do |grp|
      a << grp.user_id
    end
    # @users = []
    # a.each do |user|
    #   @users << User.where('id=?',user).first
    # end
    @group_membership = GroupMembership.new
    @friends = current_user.friends.where.not(:id =>a) rescue nil
  end

  # GET /group_memberships/1/edit
  def edit
  end

  # POST /group_memberships
  # POST /group_memberships.json
  def create
    @group = Group.find(params[:group_membership][:group_id])
    params[:professor][:expertise].each do |id|
       @group_membership = GroupMembership.create(:group_id=>@group.id , 
        :user_id=>id.to_i, :group_name=>@group.group_name)
    end
    respond_to do |format|
      format.html { redirect_to new_group_membership_path(:group_id=>params[:group_membership][:group_id]), notice: 'Group membership was successfully created.' }      
    end
  end

  # PATCH/PUT /group_memberships/1
  # PATCH/PUT /group_memberships/1.json
  def update
    respond_to do |format|
      if @group_membership.update(group_membership_params)
        format.html { redirect_to @group_membership, notice: 'Group membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_membership }
      else
        format.html { render :edit }
        format.json { render json: @group_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_memberships/1
  # DELETE /group_memberships/1.json
  def delete_user
    @group_membership = GroupMembership.find(params[:member_id])
    @group_membership.destroy
    respond_to do |format|
      format.html { redirect_to new_group_membership_path(:group_id=>params[:group_id]), notice: 'Group membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def destroy
    @group_membership.destroy
    respond_to do |format|
      format.html { redirect_to group_memberships_url, notice: 'Group membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_membership
      @group_membership = GroupMembership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_membership_params
      params.require(:group_membership).permit(:group_id, :user_id, :group_name)
    end
end
