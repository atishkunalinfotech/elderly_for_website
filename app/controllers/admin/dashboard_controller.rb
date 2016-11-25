class Admin::DashboardController < ApplicationController
  def index
  	@users = User.where.not(id: current_user.id) rescue nil
  end
end
